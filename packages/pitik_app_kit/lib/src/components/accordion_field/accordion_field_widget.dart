// ignore_for_file: no_logic_in_create_state;, no_logic_in_create_state, must_be_immutable, use_key_in_widget_constructors, slash_for_doc_comments, depend_on_referenced_packages
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class AccordionField extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<AccordionFieldNotifier, String> provider;
  String tag;
  String label;
  String hint;
  String alertText;
  bool hideLabel = false;
  bool isDetail;
  bool hasSubtitle;
  Color backgroundField;
  Map<String, bool> items;
  Function(String) onSpinnerSelected;

  AccordionField(
      {super.key,
      required this.provider,
      this.tag = '',
      required this.label,
      required this.hint,
      required this.alertText,
      this.hideLabel = false,
      required this.items,
      required this.onSpinnerSelected,
      this.isDetail = false,
      this.backgroundField = PitikColors.primaryLight,
      this.hasSubtitle = false});

  AutoDisposeChangeNotifierProvider<AccordionFieldNotifier> getProvider() {
    return provider(tag);
  }

  bool onInit = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getProvider());
    if (onInit) {
      Future.delayed(Duration.zero, () {
        ref.read(getProvider().notifier).isShowLabel(hideLabel);
        ref.read(getProvider().notifier).generateItems(items);
        int index = 0;
        items.forEach((key, value) {
          if (value) {
            ref.read(getProvider().notifier).setTextSelected(key);
            ref.read(getProvider().notifier).setSelectedIndex(index);
          }
          index++;
        });
        ref.read(getProvider().notifier).isHasSubtitle(hasSubtitle);
        onInit = false;
      });
    }

    final labelField = Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(color: PitikColors.black, fontSize: 14),
        ),
      ),
    );

    return Padding(
      key: controller.formKey,
      padding: EdgeInsets.only(top: !controller.hideLabel ? 16 : 0),
      child: Column(
        children: [
          if (!controller.hideLabel) labelField,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: controller.activeField ? backgroundField : PitikColors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: controller.activeField && !controller.showTooltip && controller.isShowList
                          ? PitikColors.primaryOrange
                          : controller.activeField && controller.showTooltip
                              ? PitikColors.red
                              : Colors.transparent,
                      width: 2)),
              child: controller.items.isNotEmpty
                  ? createDropdown(controller, ref)
                  : GestureDetector(
                      onTap: () {
                        if (controller.activeField) {
                          PitikDialog.showToastError(context, "$label data kosong");
                        }
                      },
                      child: createDropdown(controller, ref),
                    ),
            ),
            controller.showTooltip
                ? Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(children: [
                      Padding(padding: const EdgeInsets.only(right: 8), child: PitikAsset.icon(svg: PitikSvg.error)),
                      Expanded(
                        child: Text(
                          controller.alertText.isNotEmpty ? controller.alertText : alertText,
                          style: const TextStyle(color: PitikColors.red, fontSize: 12),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ]))
                : Container()
          ])
        ],
      ),
    );
  }

  DropdownButtonHideUnderline createDropdown(AccordionFieldNotifier controller, WidgetRef ref) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      enableFeedback: true,
      autofocus: true,
      menuItemStyleData: const MenuItemStyleData(),
      dropdownStyleData: DropdownStyleData(
          maxHeight: 260,
          padding: null,
          isOverButton: false,
          offset: const Offset(0, -5),
          scrollbarTheme: ScrollbarThemeData(
            trackVisibility: MaterialStateProperty.all(true),
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
            interactive: true,
          )),
      isExpanded: true,
      isDense: true,
      alignment: Alignment.centerLeft,
      focusNode: controller.focusNode,
      buttonStyleData: const ButtonStyleData(padding: null),
      iconStyleData: IconStyleData(
          icon: Align(
              alignment: Alignment.center,
              child: Row(children: [
                controller.isLoading
                    ? Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: PitikColors.primaryOrange)),
                      )
                    : Container(),
                controller.activeField
                    ? controller.isShowList
                        ? PitikAsset.iconCustom(svg: PitikSvg.arrowUp)
                        : PitikAsset.iconCustom(svg: PitikSvg.arrowDown)
                    : PitikAsset.iconCustom(svg: PitikSvg.arrowDisable),
                const SizedBox(width: 16)
              ]))),
      onMenuStateChange: (isOpen) {
        if (isOpen) {
          controller.focusNode.focusInDirection(TraversalDirection.down);
          ref.read(getProvider().notifier).expand();
        } else {
          ref.read(getProvider().notifier).collapse();
        }
      },
      items: controller.items.isNotEmpty ? renderItems(controller) : <DropdownMenuItem<String>>[],
      underline: Container(),
      hint: Text(controller.textSelected == "" ? hint : controller.textSelected, style: TextStyle(color: controller.textSelected == "" ? const Color(0xFF9E9D9D) : PitikColors.black, fontSize: 14)),
      onChanged: controller.activeField
          ? (String? newValue) {
              controller.items.forEach((key, value) {
                if (key == newValue) {
                  ref.read(getProvider().notifier).setTextSelected(key);
                  ref.read(getProvider().notifier).setItemsValue(key, true);

                  int index = 0;
                  controller.items.forEach((label, value) {
                    if (key == label) {
                      controller.selectedIndex = index;

                      // for selected object
                      if (controller.listObject.isNotEmpty) {
                        controller.selectedObject = controller.listObject[controller.selectedIndex];
                      }
                    }
                    index++;
                  });

                  onSpinnerSelected(key);
                  ref.read(getProvider().notifier).hideAlert();
                  ref.read(getProvider().notifier).collapse();
                } else {
                  controller.items[key] = false;
                }
              });
            }
          : null,
    ));
  }

  List<DropdownMenuItem<String>> renderItems(
    AccordionFieldNotifier controller,
  ) {
    List<DropdownMenuItem<String>> result = [];

    controller.items.forEach((key, value) {
      result.add(DropdownMenuItem(
          value: key,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            controller.items[key] == true ? PitikAsset.icon(svg: PitikSvg.onSpin) : PitikAsset.icon(svg: PitikSvg.offSpin),
            const SizedBox(width: 8),
            if (isDetail) ...[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(key, style: const TextStyle(color: PitikColors.black, fontSize: 14)),
                      Row(children: [
                        Text(
                          "Jumlah (Ekor) ",
                          style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10),
                        ),
                        Text("${controller.amountItems[key]} Ekor - ", style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10, fontWeight: FontWeight.w500)),
                        Text(
                          "Total (Kg) ",
                          style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10),
                        ),
                        Text("${controller.weightItems[key]} Kg", style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10, fontWeight: FontWeight.w500)),
                      ])
                    ],
                  ),
                ),
              )
            ],
            if (controller.hasSubtitle) ...[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(key, style: const TextStyle(color: PitikColors.black, fontSize: 14)),
                      Row(children: [
                        Text(
                          "Total Global : ",
                          style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10),
                        ),
                        Text("${controller.subtitle[key]} Kg", style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 10, fontWeight: FontWeight.w700)),
                      ])
                    ],
                  ),
                ),
              )
            ] else ...[
              Expanded(child: Text(key, style: const TextStyle(color: PitikColors.black, fontSize: 14), overflow: TextOverflow.clip))
            ],
          ])));
    });

    return result;
  }
}
