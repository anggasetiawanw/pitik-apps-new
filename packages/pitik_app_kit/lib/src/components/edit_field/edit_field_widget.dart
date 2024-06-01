import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

// ignore: must_be_immutable
class EditField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<EditFieldNotifier, String> provider;
  final String tag;
  final String label;
  final String hint;
  final String alertText;
  final String textUnit;
  final String? textPrefix;
  final Widget? childPrefix;
  final int maxInput;
  final bool hideLabel;
  final double width;
  final TextInputType inputType;
  final TextInputAction action;
  final double height;
  final bool isNumberFormatter;
  final Function(String, EditField) onTyping;
  final CrossAxisAlignment crossAxisAlignment;
  final bool obscure;

  EditField({
    super.key,
    this.tag = '',
    required this.provider,
    required this.label,
    required this.hint,
    required this.alertText,
    required this.textUnit,
    required this.maxInput,
    this.inputType = TextInputType.text,
    this.action = TextInputAction.done,
    this.hideLabel = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.onTyping,
    this.width = double.infinity,
    this.textPrefix,
    this.childPrefix,
    this.height = 50,
    this.isNumberFormatter = false,
    this.obscure = false,
  });

  late String data;

  AutoDisposeChangeNotifierProvider<EditFieldNotifier> getProvider() {
    return provider(label);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeField = ref.watch(getProvider().select((value) => value.activeField));
    final showToolTip = ref.watch(getProvider().select((value) => value.showTooltip));
    final alertProvider = ref.watch(getProvider().select((value) => value.alertText));
    final textUnitProvider = ref.watch(getProvider().select((value) => value.textUnit));
    if (ref.watch(getProvider().select((value) => value.init)) == false) {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(getProvider().notifier).setObscure(obscure);
      });
      ref.read(getProvider().notifier).init = true;
    }

    final labelField = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: const TextStyle(color: PitikColors.black, fontSize: 14),
      ),
    );

    return ref.watch(getProvider().select((value) => value.showField))
        ? Padding(
            key: ref.read(getProvider()).formKey,
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                ref.watch(getProvider().select((value) => value.hideLabel)) ? Container() : labelField,
                Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: width,
                          height: height,
                          child: TextFormField(
                            expands: inputType == TextInputType.multiline ? false : false,
                            maxLines: inputType == TextInputType.multiline ? 5 : 1,
                            focusNode: ref.read(getProvider()).focusNode,
                            controller: ref.read(getProvider()).editFieldController,
                            enabled: activeField,
                            maxLength: maxInput,
                            obscureText: ref.watch(getProvider().select((value) => value.obscure)),
                            textInputAction: action,
                            keyboardType: inputType,
                            inputFormatters: inputType == TextInputType.number ? [FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))] : [],
                            onChanged: (text) {
                              ref.read(getProvider().notifier).hideAlert();
                              onTyping(text, this);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              counterText: "",
                              hintText: hint,
                              hintStyle: const TextStyle(fontSize: 15, color: Color(0xFF9E9D9D)),
                              prefixIcon: textPrefix != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text("$textPrefix", style: TextStyle(color: activeField ? PitikColors.primaryOrange : PitikColors.black, fontSize: 14)),
                                    )
                                  : null,
                              suffixIcon: obscure
                                  ? GestureDetector(
                                      onTap: () {
                                        log("obscurePassword: ${ref.watch(getProvider().select((value) => value.obscure))}");
                                        ref.read(getProvider().notifier).setObscure(!ref.watch(getProvider().select((value) => value.obscure)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: PitikAsset.images(
                                          image: ref.watch(getProvider().select((value) => value.obscure)) ? PitikImages.eyeOffIcon : PitikImages.eyeOnIcon,
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(textUnitProvider.isEmpty ? textUnit : textUnitProvider, style: TextStyle(color: activeField ? PitikColors.primaryOrange : PitikColors.black, fontSize: 14)),
                                    ),
                              fillColor: activeField ? PitikColors.primaryLight : PitikColors.grey,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: activeField && !showToolTip
                                      ? PitikColors.primaryOrange
                                      : activeField && showToolTip
                                          ? PitikColors.red
                                          : Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: PitikColors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: PitikColors.primaryLight)),
                              filled: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: showToolTip
                              ? Container(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: PitikAsset.icon(svg: PitikSvg.error, size: 16),
                                      ),
                                      Expanded(
                                        child: Text(
                                          alertProvider.isNotEmpty ? alertProvider : alertText,
                                          style: const TextStyle(color: PitikColors.red, fontSize: 12),
                                          overflow: TextOverflow.clip,
                                        ),
                                      )
                                    ],
                                  ))
                              : Container(),
                        )
                      ],
                    ))
              ],
            ),
          )
        : Container();
  }
}
