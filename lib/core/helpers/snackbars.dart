import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/text_styles.dart';

class AppSnackbar {
  // static void showActionSnackBar(
  //   BuildContext context, {
  //   required String message,
  //   String? actionLabel,
  //   VoidCallback? onActionPressed,
  //   bool forError = true,
  // }) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       duration: const Duration(seconds: 2),
  //       backgroundColor: forError ? Co.red : Co.primary,
  //       behavior: SnackBarBehavior.floating,
  //       margin: EdgeInsets.all(16.h),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
  //       action: actionLabel == null || onActionPressed == null ? null : SnackBarAction(label: actionLabel, onPressed: onActionPressed, textColor: Co.white),
  //       content: Text(
  //         message,
  //       ),
  //     ),
  //   );
  // }

  // static validationError(BuildContext context, String content, {int? duration}) {
  //   if (content.contains("429")) return;

  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(getSnackBar(bgColor: Colors.red, content: content, icon: CupertinoIcons.exclamationmark, iconColor: Colors.red));
  // }

  // static success(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(getSnackBar(bgColor: Colors.green, content: content, icon: Icons.done));
  // }

  // static info(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(getSnackBar(bgColor: Co.safeAreaColor, content: content, icon: CupertinoIcons.exclamationmark, iconColor: Co.primary));
  // }

  static exitSnack(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // margin: EdgeInsets.only(bottom: 10),
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      showCloseIcon: true,
      dismissDirection: DismissDirection.down,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      content: Text(L10n.tr().clickBackAgainToExit, style: TStyle.whiteRegular(18)),
    ));
  }
}

// getSnackBar({
//   required Color bgColor,
//   required String content,
//   required IconData icon,
//   Color? iconColor,
// }) {
//   return SnackBar(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
//     padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
//     showCloseIcon: true,
//     dismissDirection: DismissDirection.down,
//     closeIconColor: Colors.white,
//     duration: const Duration(seconds: 2),
//     backgroundColor: bgColor,
//     content: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(width: 30.w),
//         CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 22.h,
//             child: Icon(
//               icon,
//               color: iconColor ?? bgColor,
//               size: 35.h,
//               weight: 2,
//             )),
//         SizedBox(width: 20.w),
//         Expanded(
//           child: Text(
//             content,
//             style: TStyle.whiteBold(22),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//           ),
//         ),
//       ],
//     ),
//   );
// }
