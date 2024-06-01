// ignore_for_file: slash_for_doc_comments, depend_on_referenced_packages, must_be_immutable, use_key_in_widget_constructors, annotate_overrides, overridden_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class SuggestField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<SuggestFieldNotifier, String> provider;

  int id;
  String label;
  String hint;
  String alertText;
  bool hideLabel = false;
  bool caseSensitive;
  Widget? childPrefix;
  List<String> suggestList;
  Function(String)? onTyping;
  Function(String) onSubmitted;
  Future<Iterable<String>> Function(String)? validator;

  SuggestField(
      {required this.provider, this.id = 1, required this.label, required this.hint, this.caseSensitive = false, required this.alertText, this.childPrefix, required this.suggestList, this.onTyping, required this.onSubmitted, this.validator});

  AutoDisposeChangeNotifierProvider<SuggestFieldNotifier> getProvider() {
    return provider(label);
  }

  var suggestFieldController = TextEditingController();

  bool onInit = true;
  bool onceTextGet = true;
  String? _searchingWithQuery;
  late Iterable<String> _lastOptions = <String>[];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getProvider());

    if (onInit) {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(getProvider().notifier).generateItems(suggestList);
        onInit = false;
      });
    }

    final labelField = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: const TextStyle(color: PitikColors.black, fontSize: 14),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          if (!controller.hideLabel) labelField,
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) async {
                      _searchingWithQuery = textEditingValue.text;
                      onceTextGet = true;
                      ref.read(getProvider().notifier).hideAlert();
                      ref.read(getProvider().notifier).setEmplyObject();
                      Iterable<String> result = [];
                      if (validator == null) {
                        List<String> options = [];
                        for (var value in controller.suggestList) {
                          if (caseSensitive) {
                            if (value.contains(textEditingValue.text)) {
                              options.add(value);
                            }
                          } else {
                            if (value.toLowerCase().contains(textEditingValue.text.toLowerCase())) {
                              options.add(value);
                            }
                          }
                        }
                        result = options;
                        onTyping!(textEditingValue.text);
                        return result;
                      } else {
                        result = await validator!(textEditingValue.text);
                        if (_searchingWithQuery != textEditingValue.text) {
                          return _lastOptions;
                        }

                        _lastOptions = result;
                        return result;
                      }
                    },
                    onSelected: (text) {
                      // for selected object
                      ref.read(getProvider().notifier).unFocus();
                      Future.delayed(const Duration(milliseconds: 300), () {
                        log('$labelField selected: $text');
                        if (controller.listObject.isNotEmpty) {
                          for (int i = 0; i < controller.suggestList.length; i++) {
                            if (text == controller.suggestList[i]) {
                              ref.read(getProvider().notifier).setSelectedObject(controller.listObject[i]);
                              break;
                            }
                          }
                        }
                        onSubmitted(text);
                      });
                    },
                    fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                      if (onceTextGet) {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          ref.read(getProvider().notifier).setTextEditingController(textEditingController);
                          ref.read(getProvider().notifier).setFocusNode(focusNode);
                          onceTextGet = false;
                        });
                      }
                      return TextFormField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onFieldSubmitted: (str) => onFieldSubmitted(),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 8),
                            counterText: "",
                            hintText: hint,
                            hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9E9D9D)),
                            fillColor: controller.activeField ? PitikColors.primaryLight : PitikColors.grey,
                            prefixIcon: childPrefix,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: controller.activeField && !controller.showTooltip
                                      ? PitikColors.primaryOrange
                                      : controller.activeField && controller.showTooltip
                                          ? PitikColors.red
                                          : Colors.white,
                                  width: 2.0,
                                )),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: PitikColors.primaryLight)),
                            filled: true,
                          ));
                    },
                  ),
                ),
                if (controller.showTooltip)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(children: [Padding(padding: const EdgeInsets.only(right: 8), child: PitikAsset.iconCustom(svg: PitikSvg.error)), Text(alertText, style: const TextStyle(color: PitikColors.red, fontSize: 12))])),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
