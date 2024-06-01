// ignore_for_file: slash_for_doc_comments, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class AccordionFieldNotifier<T> extends ChangeNotifier {
  String arg;
  AccordionFieldNotifier({required this.arg});

  final FocusNode focusNode = FocusNode();
  T? selectedObject;
  List<T?> listObject = <T?>[];
  var formKey = GlobalKey<FormState>();
  var showTooltip = false;
  var activeField = true;
  var isShowList = false;
  var hideLabel = false;
  var textSelected = "";
  var selectedIndex = -1;
  Map<String, bool> items = <String, bool>{};
  var amountItems = {};
  var weightItems = {};
  var showSpinner = true;
  var isLoading = false;
  var alertText = "";
  var hasSubtitle = false;
  Map<String, String> subtitle = <String, String>{};

  void visibleSpinner() {
    showSpinner = true;
    notifyListeners();
  }

  String getTextSeletected() => textSelected;

  void isHasSubtitle(bool value) {
    hasSubtitle = value;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  get getSelectedIndex => selectedIndex;

  void isShowLabel(bool value) {
    hideLabel = value;
    notifyListeners();
  }

  void invisibleSpinner() {
    showSpinner = false;
    notifyListeners();
  }

  void setAlertText(String text) {
    alertText = text;
    notifyListeners();
  }

  void showAlert() {
    showTooltip = true;
    notifyListeners();
  }

  void hideAlert() {
    showTooltip = false;
    notifyListeners();
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  void enable() {
    activeField = true;
    notifyListeners();
  }

  void disable() {
    activeField = false;
    notifyListeners();
  }

  void expand() {
    isShowList = true;
    notifyListeners();
  }

  void collapse() {
    isShowList = false;
    notifyListeners();
  }

  void invisibleLabel() {
    hideLabel = true;
    notifyListeners();
  }

  void visibleLabel() {
    hideLabel = false;
    notifyListeners();
  }

  void setTextSelected(String text) {
    textSelected = text;
    notifyListeners();
  }

  void setupObjects(List<T?> data) {
    listObject = data;
    notifyListeners();
  }

  void rejuvenateObjects() {
    int index = 0;
    items.forEach((key, value) {
      if (value) {
        setTextSelected(key);
        selectedIndex = index;

        // for selected object
        if (listObject.isNotEmpty) {
          selectedObject = listObject[selectedIndex];
        }
      }

      index++;
    });
    notifyListeners();
  }

  void generateItems(Map<String, bool> data) {
    items.clear();
    items.addAll(data);
    notifyListeners();
  }

  void generateSubtitle(Map<String, String> data) {
    subtitle.clear();
    subtitle.addAll(data);
    notifyListeners();
  }

  void generateAmount(Map<String, int> data) {
    amountItems = data;
    notifyListeners();
  }

  void generateWeight(Map<String, double> data) {
    weightItems = data;
    notifyListeners();
  }

  void setItemsValue(String key, bool value) {
    items[key] = value;
    notifyListeners();
  }

  void addItems({required String value, required bool isActive, int milisecondsDelayed = 200}) {
    Future.delayed(Duration(milliseconds: milisecondsDelayed), () {
      items[value] = isActive;
      notifyListeners();
    });
  }

  T? getSelectedObject() => selectedObject;
  void reset() {
    selectedObject = null;
    selectedIndex = -1;
    setTextSelected('');
    notifyListeners();
  }

  void setSelected(String textSelected) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        int index = 0;
        items.forEach((key, value) {
          if (key == textSelected) {
            setTextSelected(key);
            selectedIndex = index;
            items[key] = true;

            // for selected object
            if (listObject.isNotEmpty) {
              selectedObject = listObject[selectedIndex];
            }
          } else {
            items[key] = false;
          }

          index++;
        });
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  String toString() {
    return 'AccordionFieldNotifier{arg: $arg, selectedObject: $selectedObject, listObject: $listObject, formKey: $formKey, showTooltip: $showTooltip, activeField: $activeField, isShowList: $isShowList, hideLabel: $hideLabel, textSelected: $textSelected, selectedIndex: $selectedIndex, items: $items, amountItems: $amountItems, weightItems: $weightItems, showSpinner: $showSpinner, isLoading: $isLoading, alertText: $alertText, hasSubtitle: $hasSubtitle, subtitle: $subtitle}';
  }
}
