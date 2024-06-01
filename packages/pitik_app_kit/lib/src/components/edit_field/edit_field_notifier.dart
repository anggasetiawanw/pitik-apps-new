import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EditFieldNotifier extends ChangeNotifier {
  String arg;
  EditFieldNotifier({required this.arg});

  final FocusNode focusNode = FocusNode();

  var activeField = true;
  var showField = true;
  var showTooltip = false;
  var hideLabel = false;
  var alertText = "";
  var textUnit = "";
  var init = false;
  bool obscure = false;
  var formKey = GlobalKey<FormState>();
  final editFieldController = TextEditingController();

  void setInput(String text) {
    editFieldController.text = text;
    notifyListeners();
  }

  String getInput() {
    return editFieldController.text;
  }
  String getTextUnit() => textUnit;

  double? getInputNumber() {
    return Convert.toDouble(editFieldController.text);
  }

  void changeTextUnit(String value) {
    textUnit = value;
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

  void visibleField() {
    showField = true;
    notifyListeners();
  }

  void invisibleField() {
    showField = false;
    notifyListeners();
  }

  void setAlertText(String text) {
    alertText = text;
    notifyListeners();
  }

  void setObscure(bool value) {
    obscure = value;
    notifyListeners();
  }
  void initDone() {
    init = true;
    notifyListeners();
  }

  @override
  String toString() {
    return 'EditFieldNotifier{arg: $arg, activeField: $activeField, showField: $showField, showTooltip: $showTooltip, hideLabel: $hideLabel, alertText: $alertText, init: $init, obscure: $obscure}';
  }
}
