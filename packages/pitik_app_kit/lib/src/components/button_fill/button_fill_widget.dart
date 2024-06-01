// ignore_for_file: no_logic_in_create_state;, no_logic_in_create_state, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class ButtonFill extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<ButtonFillNotifier, String> provider;
  final String label;
  final double width;
  final String tag;
  final bool statusShowOnInit;
  final bool isHaveIcon;
  final Function() onClick;
  final Widget imageAsset;

  const ButtonFill({super.key, required this.provider, this.width = double.infinity, required this.label, required this.onClick, this.tag = '', this.statusShowOnInit = true, this.isHaveIcon = false, this.imageAsset = const SizedBox()});

  AutoDisposeChangeNotifierProvider<ButtonFillNotifier> getProvider() {
    return provider(label);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool activeField = ref.watch(getProvider().select((value) => value.activeField));
    String labelProvider = ref.watch(getProvider().select((value) => value.label));
    if (ref.watch(provider(tag).select((value) => value.init)) == false) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (statusShowOnInit == false) {
          ref.read(provider(tag).notifier).disable();
        }
        ref.read(provider(tag).notifier).setInit();
      });
    }
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          width: width,
          height: 50,
          child: ElevatedButton(
            onPressed: activeField ? onClick : () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: activeField ? PitikColors.primaryOrange : PitikColors.grey,
              foregroundColor: activeField ? PitikColors.primaryOrange : PitikColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: isHaveIcon
                ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 11),
                    imageAsset
                  ])
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      labelProvider.isEmpty ? label : labelProvider,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )),
          ),
        ));
  }
}
