// ignore_for_file: no_logic_in_create_state;, no_logic_in_create_state, must_be_immutable, use_key_in_widget_constructors, slash_for_doc_comments, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class PasswordField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<PassswordNotifier, String> provider;
  String label;
  String hint;
  String tag;
  String alertText;
  String alertPasswordLength;
  String alertPassword;
  int maxInput;
  bool hideLabel = false;
  TextInputAction action;
  Function(String, AutoDisposeChangeNotifierProvider<PassswordNotifier>) onTyping;

  PasswordField(
      {super.key,
      required this.provider,
       this.tag='',
      required this.label,
      required this.hint,
      required this.alertText,
      required this.maxInput,
      this.action = TextInputAction.done,
      this.hideLabel = false,
      required this.onTyping,
      this.alertPasswordLength = "Minimum harus lebih dari 6 karakter",
      this.alertPassword = "Setidaknya ada kombinasi huruf dan angka"});

  var passwordFieldController = TextEditingController();

  AutoDisposeChangeNotifierProvider<PassswordNotifier> getProvider() {
    return provider(tag);
  }

  String getInput() {
    return passwordFieldController.text;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(provider(tag));

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
          controller.hideLabel == false ? labelField : Container(),
          Padding(
              key: controller.formKey,
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Column(children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextFormField(
                        controller: passwordFieldController,
                        enabled: controller.activeField,
                        maxLength: maxInput,
                        textInputAction: action,
                        keyboardType: TextInputType.text,
                        obscureText: controller.obscure,
                        onChanged: (text) {
                          if (controller.activeField) {
                            onTyping(text, getProvider());
                            controller.hideAlert();
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 8),
                          counterText: "",
                          hintText: hint,
                          hintStyle: const TextStyle(fontSize: 15, color: Color(0xFF9E9D9D)),
                          suffixIcon: Padding(
                              padding: const EdgeInsets.all(16),
                              child: GestureDetector(
                                  onTap: () => controller.obscure ? ref.read(getProvider().notifier).hidePassword() : ref.read(getProvider().notifier).showPassword(),
                                  child: PitikAsset.images(image: controller.obscure ? PitikImages.eyeOffIcon : PitikImages.eyeOnIcon, width: 24, height: 24))),
                          fillColor: controller.activeField ? PitikColors.primaryLight : PitikColors.grey,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: controller.activeField && controller.showTooltip
                                    ? PitikColors.primaryOrange
                                    : controller.activeField && controller.showTooltip
                                        ? PitikColors.red
                                        : Colors.white,
                                width: 2.0,
                              )),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: PitikColors.primaryLight)),
                          filled: true,
                        ))),
                Align(
                  alignment: Alignment.topLeft,
                  child: controller.showLengthAlert
                      ? Container(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: PitikAsset.icon(
                                    svg: controller.goodLength ? PitikSvg.checkPassword : PitikSvg.error,
                                    size: 14,
                                  )),
                              Text(
                                alertPasswordLength,
                                style: TextStyle(color: controller.goodLength ? PitikColors.green : PitikColors.red, fontSize: 12),
                              )
                            ],
                          ))
                      : Container(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: controller.showPasswordAlert
                      ? Container(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: PitikAsset.icon(
                                  svg: controller.goodPassword ? PitikSvg.checkPassword : PitikSvg.error,
                                  size: 14,
                                ),
                              ),
                              Text(
                                alertPassword,
                                style: TextStyle(color: controller.goodPassword ? PitikColors.green : PitikColors.red, fontSize: 12),
                              )
                            ],
                          ))
                      : Container(),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: controller.showTooltip
                        ? Container(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: PitikAsset.icon(
                                    svg: PitikSvg.error,
                                    size: 14,
                                  ),
                                ),
                                Text(
                                  controller.alertText.isEmpty ? alertText : controller.alertText,
                                  style: const TextStyle(color: PitikColors.red, fontSize: 12),
                                )
                              ],
                            ))
                        : Container())
              ]))
        ],
      ),
    );
  }
}
