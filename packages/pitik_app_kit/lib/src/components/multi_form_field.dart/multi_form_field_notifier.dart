import 'package:flutter/material.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';
import 'package:pitik_app_kit/src/style/pitik_colors.dart';

class MultipleFormFieldNotifier<T> extends ChangeNotifier {
  String arg;
  MultipleFormFieldNotifier({required this.arg});

  Map<String, Widget> listAdded = <String, Widget>{};
  Map<String, T> listObjectAdded = <String, T>{};

  String getDefaultMessageDialog() => 'Data telah ditambah, silahkan pilih Ganti atau Tambah data lama..!';
  dynamic getObject(String key, dynamic initInstance) => listObjectAdded.isEmpty ? initInstance : listObjectAdded[key];

  void removeListObj(String key) => listObjectAdded.remove(key);
  void removeListAdded(String key) => listAdded.remove(key);
  Map<String, T> getListObjectAdded() => listObjectAdded;

  void addData({required Widget child, required T object, required String key}) {
    listObjectAdded[key] = object;
    listAdded[key] = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 8, child: child),
            Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    listObjectAdded.remove(key);
                    listAdded.remove(key);
                    notifyListeners();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    // padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(color: PitikColors.primaryOrange, width: 2))),
                    child: Icon(Icons.remove, color: PitikColors.primaryOrange),
                  ),
                ))
          ],
        ),
        const SizedBox(height: 16)
      ],
    );
    notifyListeners();
  }

  @override
  String toString() {
    return 'MultipleFormFieldNotifier{listAdded: $listAdded, listObjectAdded: $listObjectAdded, arg: $arg}';
  }
}
