import 'package:flutter/material.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/theming.dart';
import 'package:pure_minds/core/extensions/context.dart';
import 'package:pure_minds/features/general_widgets/main_button.dart';
import 'package:pure_minds/features/general_widgets/spacing.dart';

class Dialogs {
  static Dialog confirmDialog({
    required String title,
    String? message,
    String? okBtn,
    Color? okColor,
    Color? okBgColor,
    String? cancelBtn,
    Color? cancelColor,
    Color? cancelBgColor,
  }) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(color: Co.white, borderRadius: AppConsts.defaultRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(20),
              Text(title, style: TStyle.blackBold(18), textAlign: TextAlign.center),
              const VerticalSpacing(10),
              if (message != null)
                Text(message, style: TStyle.blackRegular(16), textAlign: TextAlign.center),
              // const HeightSpacing(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        text: cancelBtn ?? L10n.tr().cancle,
                        bgColor: cancelBgColor ?? Co.darkGrey,
                        style: TStyle.whiteSemi(16).copyWith(color: cancelColor),
                        ontap: () {
                          AppConsts.navigatorKey.currentState!.context.myPop(result: false);
                        },
                      ),
                    ),
                    const HorizontalSpacing(20),
                    Expanded(
                      child: MainButton(
                        text: okBtn ?? L10n.tr().confirm,
                        bgColor: okBgColor ?? Co.orange,
                        style: TStyle.whiteSemi(16).copyWith(color: okColor),
                        ontap: () {
                          AppConsts.navigatorKey.currentState!.context.myPop(result: true);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // static Future<(bool, String)?> confirmWzTextField({
  //   required String title,
  //   required BuildContext context,
  //   String? label,
  //   String? okBtn,
  //   Color? okColor,
  //   Color? okBgColor,
  //   String? cancelBtn,
  //   Color? cancelColor,
  //   Color? cancelBgColor,
  //   String? initialValue,
  //   bool isRequired = true,
  //   int? maxLiens,
  //   bool canChange = true,
  // }) async {
  //   final controller = TextEditingController(text: initialValue);
  //   final formKey = GlobalKey<FormState>();
  //   return await showDialog<(bool, String)?>(
  //     context: context,
  //     builder: (context) => Dialog(
  //       child: Container(
  //         decoration: BoxDecoration(color: Co.white, borderRadius: AppConsts.defaultRadius),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10.w),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const VerticalSpacing(20),
  //               Text(
  //                 title,
  //                 style: TStyle.blackBold(16),
  //               ),
  //               const VerticalSpacing(10),
  //               Form(
  //                 key: formKey,
  //                 child: MainTextField(
  //                   controller: controller,
  //                   label: label,
  //                   enabled: canChange,
  //                   showBorder: true,
  //                   validator: isRequired ? Validators.notEmpty : null,
  //                   borderColor: Co.black,
  //                   maxLines: maxLiens,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //                 child: Row(
  //                   children: [
  //                     if (canChange)
  //                       Expanded(
  //                         child: MainButton(
  //                           text: cancelBtn ?? L10n.tr().cancel,
  //                           bgColor: cancelBgColor ?? Co.secondry,
  //                           style: cancelColor == null ? null : TStyle.whiteSemi(16).copyWith(color: cancelColor),
  //                           ontap: () {
  //                             AppConsts.navigatorKey.currentState!.context.myPop(result: (false, ''));
  //                           },
  //                         ),
  //                       ),
  //                     const HorizontalSpacing(20),
  //                     Expanded(
  //                       child: MainButton(
  //                         text: okBtn ?? L10n.tr().confirm,
  //                         bgColor: okBgColor ?? Co.primary,
  //                         style: okColor == null ? null : TStyle.whiteSemi(16).copyWith(color: okColor),
  //                         ontap: () {
  //                           if (isRequired && controller.text.isEmpty) {
  //                             Alerts.showToast(L10n.tr().pleaseFillAllFields);
  //                             return;
  //                           }
  //                           AppConsts.navigatorKey.currentState!.context.myPop(
  //                             result: canChange ? (true, controller.text) : null,
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // static mainErrorDialog(ErrorModel errorModel) {
  //   return Dialog(
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(CupertinoIcons.clear_circled_solid, color: Co.red, size: 35.r),
  //           const VerticalSpacing(20),
  //           ListView.separated(
  //             shrinkWrap: true,
  //             itemCount: (errorModel.errors ?? []).length,
  //             separatorBuilder: (context, index) => Padding(
  //               padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
  //               child: const Divider(),
  //             ),
  //             itemBuilder: (context, index) {
  //               return Row(
  //                 children: [
  //                   Icon(CupertinoIcons.circle_fill, color: Co.lightGrey, size: 13.r),
  //                   const HorizontalSpacing(10),
  //                   Expanded(child: Text((errorModel.errors!)[index], style: TStyle.blackSemi(14))),
  //                 ],
  //               );
  //             },
  //           ),
  //           const VerticalSpacing(20),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // static infoDialog({required String title, String? message, String? okBtn, Color? okColor, Color? okBgColor}) {
  //   return Dialog(
  //     child: Container(
  //       decoration: BoxDecoration(color: Co.white, borderRadius: AppConsts.defaultRadius),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 15.w),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const VerticalSpacing(20),
  //             Text(title, style: TStyle.blackBold(18)),
  //             const VerticalSpacing(10),
  //             if (message != null) Text(message, style: TStyle.blackRegular(16)),
  //             // const HeightSpacing(20),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
  //               child: MainButton(
  //                 text: okBtn ?? L10n.tr().confirm,
  //                 bgColor: okBgColor ?? Co.primary,
  //                 style: okColor == null ? null : TStyle.whiteSemi(16).copyWith(color: okColor),
  //                 ontap: () {
  //                   AppConsts.navigatorKey.currentState!.context.myPop(result: true);
  //                 },
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
