import 'package:flutter/material.dart';

class SearchBarNotifier extends ChangeNotifier {
  String arg;
  SearchBarNotifier({required this.arg});

  String selectedValue = "";
  bool isShowList = false;
  FocusNode focusNode = FocusNode();
  List<String> items = [];
  TextEditingController textSearch = TextEditingController();
  bool isShowAccordion = false;

  void clearText() => textSearch.clear();
  String getSearchText() => textSearch.text;
  bool init = false;

  void setDefaultSelected() {
    if (items.isNotEmpty) {
      selectedValue = items[0];
      notifyListeners();
    }
  }

  void setSelectedValue(String value) {
    if (items.contains(value)) {
      selectedValue = value;
    } else {
      if (items.isNotEmpty) {
        selectedValue = items[0];
      } else {
        selectedValue = "";
      }
    }
    notifyListeners();
  }

  void generateItem(List<String> items) {
    this.items = items;
    selectedValue = items[0];
    notifyListeners();
  }

  void showAccordion() {
    isShowAccordion = true;
    notifyListeners();
  }

  void hideAccordion() {
    isShowAccordion = false;
    notifyListeners();
  }

  void changeShowAccordion(bool show) {
    isShowAccordion = show;
    notifyListeners();
  }

  void setInit() {
    init = true;
    notifyListeners();
  }

  void setShowList(bool show) {
    isShowList = show;
    notifyListeners();
  }

  @override
  String toString() {
    return 'SearchBarNotifier{arg: $arg, selectedValue: $selectedValue, isShowList: $isShowList, items: $items, isShowAccordion: $isShowAccordion}';
  }
}
