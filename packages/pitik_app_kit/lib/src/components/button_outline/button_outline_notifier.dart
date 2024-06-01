


import 'package:flutter/material.dart';

class ButtonOutlineNofitier extends ChangeNotifier {
    String arg;
    ButtonOutlineNofitier({required this.arg});

    bool activeField = true;
    void enable(){
        activeField = true;
        notifyListeners();
    } 

    void disable(){ 
        activeField = false;
        notifyListeners();
    }

    @override
    String toString() {
        return 'ButtonOutlineNofitier{arg: $arg, activeField: $activeField}';
    }
}
