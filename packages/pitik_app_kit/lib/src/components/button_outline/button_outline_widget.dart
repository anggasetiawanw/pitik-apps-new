// ignore_for_file: no_logic_in_create_state;, no_logic_in_create_state, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class ButtonOutline extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<ButtonOutlineNofitier, String> provider;
  final String tag;
  final String label;
  final double width;
  final bool isHaveIcon;
  final PitikSvg imageAsset;
  final Function() onClick;

  const ButtonOutline({super.key, this.width = double.infinity, this.tag= '', required this.provider, required this.label, this.isHaveIcon = false, this.imageAsset = PitikSvg.checkboxCircleGreen, required this.onClick});
  AutoDisposeChangeNotifierProvider<ButtonOutlineNofitier> getProvider() {
    return provider(tag);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool activeField = ref.watch(provider(tag)).activeField;
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          width: width,
          height: 50,
          child: ElevatedButton(
            onPressed: activeField ? onClick : () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: activeField ? Colors.white : PitikColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 2, color: activeField ? PitikColors.primaryOrange : PitikColors.grey),
              ),
            ),
            child: isHaveIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: activeField ? PitikColors.primaryOrange : Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 11),
                      PitikAsset.icon(svg: imageAsset, size: 22),
                    ],
                  )
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: activeField ? PitikColors.primaryOrange : Colors.white, fontSize: 14),
                    ),
                  )),
          ),
        ));
  }
}
