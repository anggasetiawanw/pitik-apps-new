import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class PitikDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: PitikColors.primaryOrange),
            const SizedBox(width: 16),
            Text('Mohon Tunggu...', style: PitikTextStyle.body(color: PitikColors.primaryOrange)),
          ],
        ),
      ),
    );
  }

  static void showLoadingPage(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(1),
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.stretchedDots(color: PitikColors.primaryOrange, size: 64),
            const SizedBox(height: 16),
            Text('Mohon Tunggu...', style: PitikTextStyle.body(color: PitikColors.primaryOrange)),
          ],
        ),
      ),
    );
  }

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 16),
            Text(
              'Gagal',
              style: PitikTextStyle.headingSm(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PitikColors.primaryOrange,
            ),
            child: Text(
              "Ok",
              style: PitikTextStyle.body(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  static void showInfoDialog(BuildContext context, String message, Function() onOk, {bool isYESNO = false}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        title: Row(
          children: [
            PitikAsset.icon(svg: PitikSvg.information, size: 24),
            const SizedBox(width: 16),
            Text(
              'Informasi',
              style: PitikTextStyle.headingXs(),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PitikColors.primaryOrange,
            ),
            child: Text(
              "Ya",
              style: PitikTextStyle.body(color: Colors.white),
            ),
            onPressed: () {
              if (onOk() != null) {
                onOk();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          if (isYESNO)
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: PitikColors.primaryOrange, width: 1)),
              child: Text(
                "Tidak",
                style: PitikTextStyle.body(color: PitikColors.primaryOrange),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
        ],
      ),
    );
  }

  static showToastSuccess(BuildContext context, String message) {
    final fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: PitikColors.primaryOrange,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(child: Text(message, style: PitikTextStyle.custom(color: Colors.white))),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static showToastError(BuildContext context, String message) {
    final fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: PitikColors.red,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(child: Text(message, style: PitikTextStyle.custom(color: Colors.white))),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
