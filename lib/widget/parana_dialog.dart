import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class ParanaDialog {
  void show(context, String title, double khoiLuong) {
    PanaraInfoDialog.show(
      context,
      title: "${khoiLuong.toString()} \$",
      message: title.toString(),
      buttonText: "Okay",
      onTapDismiss: () {
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: true, // optional parameter (default is true)
    );
  }
}
