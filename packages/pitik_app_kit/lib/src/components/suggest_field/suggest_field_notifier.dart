import 'package:flutter/cupertino.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class SuggestFieldNotifier<T> extends ChangeNotifier {
  String arg;
  SuggestFieldNotifier({required this.arg});
  FocusNode focusNode = FocusNode();

  TextEditingController textEditingController = TextEditingController();

  List<T?> listObject = <T?>[];
  T? selectedObject;
  var showTooltip = false;
  var activeField = true;
  var hideLabel = false;
  var isShowList = false;
  List<String> suggestList = <String>[];

  void showAlert() {
    showTooltip = true;
    notifyListeners();
  }

  void setEmplyObject() {
    selectedObject = null;
    notifyListeners();
  }

  T? getSelectedObject() => selectedObject;

  double? getInputNumber() {
    return Convert.toDouble(textEditingController.text);
  }

  void setTextEditingController(TextEditingController textEditingController) {
    this.textEditingController = textEditingController;
    notifyListeners();
  }

  void setFocusNode(FocusNode focusNode) {
    this.focusNode = focusNode;
    notifyListeners();
  }

  void getFocusNode() => focusNode;

  void hideAlert() => {showTooltip = false, notifyListeners()};
  void enable() {
    activeField = true;
    notifyListeners();
  }

  void disable() {
    activeField = false;
    notifyListeners();
  }

  void visibleLabel() {
    hideLabel = false;
    notifyListeners();
  }

  void unFocus() {
    focusNode.unfocus();
    notifyListeners();
  }

  void invisibleLabel() {
    hideLabel = true;
    notifyListeners();
  }

  void setupObjects(List<T?> data) {
    listObject.clear();
    listObject.addAll(data);
    notifyListeners();
  }

  void generateItems(List<String> data) {
    suggestList.clear();
    suggestList.addAll(data);
    notifyListeners();
  }

  void addItems(String data) {
    suggestList.add(data);
    notifyListeners();
  }

  void reset({useDelayed = false}) {
    Future.delayed(Duration(milliseconds: useDelayed ? 100 : 0), () {
      selectedObject = null;
      textEditingController.text = '';
      notifyListeners();
    });
  }

  void setSelectedObject(T object) {
    selectedObject = object;
    notifyListeners();
  }

  void dissmisDialog() {
    focusNode.unfocus();
    textEditingController.text = '';
    notifyListeners();
  }

  @override
  String toString() {
    return 'SuggestFieldNotifier{arg: $arg, focusNode: $focusNode, textEditingController: $textEditingController, listObject: ${listObject.length}, selectedObject: $selectedObject, showTooltip: $showTooltip, activeField: $activeField, hideLabel: $hideLabel, suggestList: $suggestList}';
  }
}
