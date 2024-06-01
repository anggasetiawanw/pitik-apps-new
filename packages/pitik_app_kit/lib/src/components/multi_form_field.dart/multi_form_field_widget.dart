// ignore_for_file: must_be_immutable, slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class MultipleFormField<T> extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<MultipleFormFieldNotifier, String> provider;
  Widget child;
  Function() childAdded;
  Function(T) increaseWhenDuplicate;
  String labelButtonAdd;
  String titleDialogWhenDuplicate;
  Function()? messageDialogWhenDuplicate;
  Function() selectedObject;
  Function(T) selectedObjectWhenIncreased;
  Function() keyData;
  Function() validationAdded;
  Function()? onAfterAdded;
  dynamic initInstance;
  EdgeInsetsGeometry padding;
  Decoration decoration;

  MultipleFormField(
      {super.key,
      required this.provider,
      required this.child,
      required this.childAdded,
      required this.increaseWhenDuplicate,
      required this.labelButtonAdd,
      required this.selectedObject,
      this.titleDialogWhenDuplicate = 'Perhatian !',
      this.messageDialogWhenDuplicate,
      required this.selectedObjectWhenIncreased,
      required this.initInstance,
      required this.validationAdded,
      required this.keyData,
      this.decoration = const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), border: Border.fromBorderSide(BorderSide(color: PitikColors.greyBackground, width: 3))),
      this.padding = const EdgeInsets.all(16),
      this.onAfterAdded});

  AutoDisposeChangeNotifierProvider<MultipleFormFieldNotifier> getProvider() {
    return provider('');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getProvider());
    final CustomDialog customDialog = CustomDialog(context, Dialogs.YES_NO_OPTION).titleButtonOk("Ganti").titleButtonNo("Tambah");
    return Column(
      children: [
        Container(
          padding: padding,
          decoration: decoration,
          child: Column(children: [
            child,
            ButtonFill(
                provider: ProviderCreator.addButtonFillProvider(),
                label: labelButtonAdd,
                isHaveIcon: true,
                imageAsset: const Icon(Icons.add, color: Colors.white),
                onClick: () {
                  if (validationAdded()) {
                    if (controller.listAdded.containsKey(keyData())) {
                      customDialog
                          .title(titleDialogWhenDuplicate)
                          .message(messageDialogWhenDuplicate == null ? '${keyData()} telah ditambah, silahkan pilih Ganti atau Tambah data lama..!' : messageDialogWhenDuplicate!())
                          .listener(CustomDialogListener(onDialogOk: (context, id, packet) {
                            controller.addData(child: childAdded(), object: selectedObject(), key: keyData());
                            afterAdded();
                          }, onDialogCancel: (context, id, packet) {
                            T data = selectedObjectWhenIncreased(ref.read(getProvider()).getObject(keyData(), initInstance));
                            ref.read(getProvider().notifier).addData(child: increaseWhenDuplicate(data), object: data, key: keyData());
                            afterAdded();
                          }))
                          .show();
                    } else {
                      ref.read(getProvider().notifier).addData(child: childAdded(), object: selectedObject(), key: keyData());
                      afterAdded();
                    }
                  }
                })
          ]),
        ),
        const SizedBox(height: 16),
        Column(children: controller.listAdded.entries.map((entry) => entry.value).toList())
      ],
    );
  }

  void afterAdded() {
    if (onAfterAdded != null) {
      Future.delayed(const Duration(milliseconds: 200), () => onAfterAdded!());
    }
  }
}
