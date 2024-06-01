// ignore_for_file: slash_for_doc_comments, depend_on_referenced_packages

import 'package:flutter/material.dart';

class MediaFieldNotifier extends ChangeNotifier {
  String arg;
  MediaFieldNotifier({required this.arg});

  var showTooltop = false;
  var showInformasi = false;
  var activeField = true;
  var hideLabel = false;
  var fileName = "";
  var informasiText = "";

  var formKey = GlobalKey<FormState>();

  void showInformation() {
    showInformasi = true;
    notifyListeners();
  }

  void hideInformation() {
    showInformasi = false;
    notifyListeners();
  }

  void showAlert() {
    showTooltop = true;
    notifyListeners();
  }

  void hideAlert() {
    showTooltop = false;
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

  void setFileName(String value) {
    fileName = value;
    notifyListeners();
  }

  void setInformasiText(String value) {
    informasiText = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'MediaFieldNotifier{arg: $arg, showTooltop: $showTooltop, showInformasi: $showInformasi, activeField: $activeField, hideLabel: $hideLabel, fileName: $fileName, informasiText: $informasiText}';
  }
}
