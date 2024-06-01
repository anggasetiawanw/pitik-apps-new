// ignore_for_file: slash_for_doc_comments, depend_on_referenced_packages

import 'package:flutter/material.dart';

/// @author Robertus Mahardhi Kuncoro
/// @email <robert.kuncoro@pitik.id>
/// @create date 09/08/23

class DateTimeFieldNotifier extends ChangeNotifier {
  String arg;
  DateTimeFieldNotifier({required this.arg});

  var showTooltip = false;
  var activeField = true;
  var hideLabel = false;
  var textSelected = "";
  var formKey = GlobalKey<FormState>();

  String label = "";

  void showAlert() {
    showTooltip = true;
    notifyListeners();
  }

  void hideAlert() {
    showTooltip = false;
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

  String getTextSelected() {
    return textSelected;
  }

  void setLabel(String newLabel) {
    label = newLabel;
    notifyListeners();
  }

  @override
  String toString() {
    return 'DateTimeFieldNotifier{arg: $arg, activeField: $activeField, hideLabel: $hideLabel, textSelected: $textSelected, label: $label}';
  }
}
