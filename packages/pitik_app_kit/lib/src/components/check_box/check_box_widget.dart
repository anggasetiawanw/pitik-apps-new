import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class CheckBoxField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<CheckBoxNotifier, String> provider;
  final String title;
  final Function(bool) onTap;
  const CheckBoxField({super.key, required this.provider, required this.title, required this.onTap});
  AutoDisposeChangeNotifierProvider<CheckBoxNotifier> getProvider() {
    return provider(title);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(getProvider().select((value) => value.isChecked));
    return GestureDetector(
      onTap: () {
        if (isChecked) {
          ref.read(getProvider()).unchecked();
        } else {
          ref.read(getProvider()).checked();
        }
        onTap(ref.read(getProvider()).isChecked);
      },
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: isChecked ? PitikColors.primaryOrange : PitikColors.grey, width: 2)), color: isChecked ? PitikColors.primaryOrange : Colors.transparent),
            child: isChecked ? const Icon(Icons.check, color: Colors.white, size: 17) : const SizedBox(),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)))
        ],
      ),
    );
  }
}
