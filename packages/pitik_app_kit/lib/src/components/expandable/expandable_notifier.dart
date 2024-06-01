import 'package:flutter/material.dart';

class ExpandableNotifier extends ChangeNotifier {
  String tag;
  ExpandableNotifier({required this.tag});

  var expanded = false;

  void expand() {
    expanded = true;
    notifyListeners();
  }

  void collapse() {
    expanded = false;
    notifyListeners();
  }

  void setExpanded(bool value) {
    expanded = value;
    notifyListeners();
  }
}
