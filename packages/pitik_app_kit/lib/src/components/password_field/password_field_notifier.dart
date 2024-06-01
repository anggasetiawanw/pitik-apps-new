import 'package:flutter/material.dart';

class PassswordNotifier extends ChangeNotifier {
  String arg;
  PassswordNotifier({required this.arg});

  var activeField = true;
  var showTooltip = false;
  var showLengthAlert = false;
  var showPasswordAlert = false;
  var goodLength = false;
  var goodPassword = false;
  var hideLabel = false;
  var obscure = true;
  var formKey = GlobalKey<FormState>();
  var alertText = "";
  var init = false;

  void beGoodLength() {
    goodLength = true;
    notifyListeners();
  }

  void beBadLength() {
    goodLength = false;
    notifyListeners();
  }

  void beGoodPassword() {
    goodPassword = true;
    notifyListeners();
  }

  void beBadPassword() {
    goodPassword = false;
    notifyListeners();
  }

  void showAlertLength() {
    showLengthAlert = true;
    notifyListeners();
  }

  void hideAlertLength() {
    showLengthAlert = false;
    notifyListeners();
  }

  void showAlertPassword() {
    showPasswordAlert = true;
    notifyListeners();
  }

  void hideAlertPassword() {
    showPasswordAlert = false;
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

  void showPassword() {
    obscure = true;
    notifyListeners();
  }

  void hidePassword() {
    obscure = false;
    notifyListeners();
  }

  void initDOne() {
    init = true;
    notifyListeners();
  }

  void setAlertText(String text) {
    alertText = text;
    notifyListeners();
  }

  @override
  String toString() {
    return 'PassswordNotifier{arg: $arg, activeField: $activeField, showTooltip: $showTooltip, showLengthAlert: $showLengthAlert, showPasswordAlert: $showPasswordAlert, goodLength: $goodLength, goodPassword: $goodPassword, hideLabel: $hideLabel, obscure: $obscure, alertText: $alertText, init: $init}';
  }
}
