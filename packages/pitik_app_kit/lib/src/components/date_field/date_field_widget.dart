// ignore_for_file: no_logic_in_create_state;, no_logic_in_create_state, must_be_immutable, use_key_in_widget_constructors, slash_for_doc_comments, depend_on_referenced_packages, constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

/// @author Robertus Mahardhi Kuncoro
/// @email <robert.kuncoro@pitik.id>
/// @create date 09/08/23

class DateTimeField extends ConsumerWidget {
  static const int DATE_FLAG = 1;
  static const int TIME_FLAG = 2;
  static const int ALL_FLAG = 3;

  final AutoDisposeChangeNotifierProviderFamily<DateTimeFieldNotifier, String> provider;
  String tag;
  String label;
  String hint;
  String alertText;
  bool hideLabel = false;
  int flag;
  Function(DateTime, DateTimeField) onDateTimeSelected;

  DateTimeField({super.key, required this.provider,  this.tag ='', required this.label, required this.hint, required this.alertText, this.flag = ALL_FLAG, required this.onDateTimeSelected});

  AutoDisposeChangeNotifierProvider<DateTimeFieldNotifier> getProvider() {
    return provider(tag);
  }

  DateTime _lastDateTime = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(provider(tag));
    final labelField = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        controller.label.isEmpty ? label : controller.label,
        textAlign: TextAlign.left,
        style: const TextStyle(color: PitikColors.black, fontSize: 14),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          if (controller.hideLabel == false) labelField,
          Padding(
              key: controller.formKey,
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _showPicker(context, controller, ref),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: controller.activeField ? PitikColors.primaryLight : PitikColors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: controller.activeField && controller.showTooltip == false
                                  ? Colors.transparent
                                  : controller.activeField && controller.showTooltip
                                      ? PitikColors.red
                                      : Colors.transparent,
                              width: 2)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(controller.textSelected == "" ? hint : controller.textSelected,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: controller.activeField && controller.textSelected != ""
                                            ? PitikColors.black
                                            : controller.activeField && controller.textSelected == ""
                                                ? PitikColors.greyLightText
                                                : PitikColors.black,
                                        fontSize: 14)),
                              )),
                          Expanded(
                            flex: 1,
                            child: controller.activeField
                                ? flag == DATE_FLAG || flag == ALL_FLAG
                                    ? PitikAsset.iconCustom(svg: PitikSvg.calendarLine)
                                    : PitikAsset.iconCustom(svg: PitikSvg.timeOn)
                                : flag == DATE_FLAG || flag == ALL_FLAG
                                    ? PitikAsset.iconCustom(svg: PitikSvg.calendarLineOff)
                                    : PitikAsset.iconCustom(svg: PitikSvg.timeOff),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: controller.showTooltip
                        ? Container(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Padding(padding: const EdgeInsets.only(right: 8), child: PitikAsset.iconCustom(svg: PitikSvg.error)),
                                Expanded(
                                  child: Text(
                                    alertText,
                                    style: const TextStyle(color: PitikColors.red, fontSize: 12),
                                    overflow: TextOverflow.clip,
                                  ),
                                )
                              ],
                            ))
                        : Container(),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Future<void> _showPicker(BuildContext context, DateTimeFieldNotifier controller, WidgetRef ref) async {
    if (controller.activeField) {
      if (flag == DATE_FLAG) {
        DateTime? pickedDate = await showDatePicker(context: context, initialDate: _lastDateTime, firstDate: DateTime(1900), lastDate: DateTime(2200));

        if (pickedDate != null) {
          _lastDateTime = pickedDate;
          ref.read(provider(tag).notifier).hideAlert();
          onDateTimeSelected(_lastDateTime, this);
        }
      } else if (flag == TIME_FLAG) {
        TimeOfDay initTime = TimeOfDay.fromDateTime(_lastDateTime);
        TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: initTime.replacing(hour: initTime.hourOfPeriod));

        if (pickedTime != null) {
          _lastDateTime = DateTime(_lastDateTime.year, _lastDateTime.month, _lastDateTime.day, pickedTime.hour, pickedTime.minute);

          ref.read(provider(tag).notifier).hideAlert();
          onDateTimeSelected(_lastDateTime, this);
        }
      } else {
        DateTime? pickedDate = await showDatePicker(context: context, initialDate: _lastDateTime, firstDate: DateTime(1900), lastDate: DateTime(2200));

        if (pickedDate != null) {
          _lastDateTime = pickedDate;
          TimeOfDay initTime = TimeOfDay.fromDateTime(pickedDate);
          TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: initTime.replacing(hour: initTime.hourOfPeriod));

          if (pickedTime != null) {
            _lastDateTime = DateTime(_lastDateTime.year, _lastDateTime.month, _lastDateTime.day, pickedTime.hour, pickedTime.minute);
            ref.read(provider(tag).notifier).hideAlert();
            onDateTimeSelected(_lastDateTime, this);
          }
        }
      }
    }
  }
}
