import 'package:flutter/material.dart';

class ButtonFillNotifier extends ChangeNotifier {
  dynamic arg;
  ButtonFillNotifier({required this.arg});

  bool activeField = true;
  bool init = false;
  String label = "";
  void enable() {
    activeField = true;
    notifyListeners();
  }

  void disable() {
    activeField = false;
    notifyListeners();
  }

  void setInit() {
    init = true;
    notifyListeners();
  }

  void changeLabel(String newLabel) {
    label = newLabel;
    notifyListeners();
  }

  @override
  String toString() {
    return 'ButtonFillNotifier{tag: $arg, activeField: $activeField, init: $init, label: $label}';
  }
}
