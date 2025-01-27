import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
// import 'package:panara_dialogs/panara_dialogs.dart';

class Alerts {
  static exitSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        showCloseIcon: true,
        dismissDirection: DismissDirection.down,
        duration: const Duration(seconds: 2),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        content: Text(
          // L10n.tr().pressDoubleBackToExit,
          msg,
          style: TStyle.whiteBolder(16),
        ),
      ),
    );
  }

  static void showToast(
    String message, {
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    bool error = true,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: 16,
      backgroundColor: error ? Co.red : Co.orange,
      textColor: Co.white,
    );
  }
}
