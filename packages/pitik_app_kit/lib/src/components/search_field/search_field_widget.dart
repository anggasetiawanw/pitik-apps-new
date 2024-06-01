import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

// ignore: must_be_immutable
class SearchBarField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<SearchBarNotifier, String> provider;
  final String tag;
  final List<String> items;
  final Function(String, SearchBarField) onTyping;
  final Function(String) onCategorySelected;
  final String? hint;
  final bool addPrefixDropdown;

  SearchBarField({super.key, required this.provider, this.hint, required this.items, required this.onTyping, required this.onCategorySelected, this.addPrefixDropdown = true, this.tag = ''});

  bool onInit = true;
  AutoDisposeChangeNotifierProvider<SearchBarNotifier> getProvider() {
    return provider(tag);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(provider(tag));
    final itemsProvider = ref.watch(provider(tag).select((value) => value.items));
    if (onInit) {
      onInit = false;
      Future.delayed(const Duration(milliseconds: 200), () {
        ref.read(getProvider().notifier).generateItem(items);
        if (itemsProvider.isNotEmpty) {
          ref.read(getProvider().notifier).setDefaultSelected();
        }
        if (addPrefixDropdown) {
          ref.read(getProvider().notifier).showAccordion();
        } else {
          ref.read(getProvider().notifier).hideAccordion();
        }
      });
    }

    return TextField(
      controller: controller.textSearch,
      focusNode: controller.focusNode,
      onChanged: (text) => onTyping(text, this),
      cursorColor: PitikColors.primaryOrange,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFF9ED),
        contentPadding: const EdgeInsets.only(left: 4.0),
        hintText: hint ?? "Cari ${controller.selectedValue}",
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        suffixIcon: controller.isShowAccordion
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: PitikAsset.icon(
                  svg: PitikSvg.search,
                  size: 24,
                ))
            : null,
        prefixIcon: controller.isShowAccordion
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      const SizedBox(height: 1),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                            isExpanded: true,
                            customButton: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.selectedValue,
                                      style: const TextStyle(fontSize: 14, color: PitikColors.black),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // const SizedBox(width: 8),
                                  PitikAsset.icon(
                                    svg: controller.isShowList ? PitikSvg.arrowUp : PitikSvg.arrowDown,
                                    size: 8,
                                  ),
                                ],
                              ),
                            ),
                            items: controller.items.map((item) => DropdownMenuItem(value: item, child: Text(item, style: PitikTextStyle.custom(fontSize: 14, color: PitikColors.black)))).toList(),
                            value: controller.selectedValue,
                            onChanged: (String? value) {
                              controller.selectedValue = value ?? "";
                              onCategorySelected(controller.selectedValue);
                            },
                            onMenuStateChange: (isOpen) {
                              ref.read(getProvider().notifier).setShowList(isOpen);
                            },
                            dropdownStyleData: DropdownStyleData(
                              width: MediaQuery.of(context).size.width * 0.5,
                            )),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: PitikAsset.icon(svg: PitikSvg.search, size: 8),
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
            color: PitikColors.primaryOrange,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
            color: PitikColors.primaryOrange,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
            color: PitikColors.primaryOrange,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.0,
            color: PitikColors.primaryOrange,
          ),
        ),
      ),
    );
  }
}
