import 'package:flutter/material.dart';

class CheckBoxNotifier extends ChangeNotifier {
  String arg;
  CheckBoxNotifier({required this.arg});

  var isChecked = false;
  void checked() {
    isChecked = true;
    notifyListeners();
  }

  void unchecked() {
    isChecked = false;
    notifyListeners();
  }

  bool status() => isChecked;
}
