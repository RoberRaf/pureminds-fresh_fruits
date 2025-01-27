import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pure_minds/config/app_consts.dart';
import 'package:pure_minds/config/localization/l10n/l10n.dart';
import 'package:pure_minds/config/theming/app_colors.dart';
import 'package:pure_minds/config/theming/text_styles.dart';
import 'package:pure_minds/features/general_widgets/main_progress_indicator.dart';

export 'package:flutter/services.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.isLoading = false,
    this.hintText,
    this.label,
    this.style,
    this.onChange,
    this.onSubmitting,
    this.validator,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.hieght,
    this.width,
    this.isPassword = false,
    this.borderRadius,
    this.borderColor,
    this.foucusedColor,
    this.bgColor,
    this.isFilled = true,
    this.showBorder = true,
    this.inputFormatters,
    this.padding,
    this.iconsConstraints,
    this.isValid,
    this.showShadow = false,
    this.maxLines,
    this.prefixOnTap,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextStyle? style;
  final bool enabled;
  final bool isLoading;
  final Function(String)? onChange;
  final Function(String?)? onSubmitting;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final double? hieght;
  final double? width;
  final double? borderRadius;
  final Color? borderColor;
  final Color? foucusedColor;
  final bool isPassword;
  final bool isFilled;
  final bool showBorder;
  final Color? bgColor;
  final TextInputFormatter? inputFormatters;
  final EdgeInsets? padding;
  final BoxConstraints? iconsConstraints;
  final bool? isValid;
  final bool showShadow;
  final int? maxLines;
  final VoidCallback? prefixOnTap;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late final ValueNotifier<bool> isObscure;
  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.isPassword);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final iconContraints = widget.iconsConstraints ?? BoxConstraints(minHeight: 25.h, maxHeight: 40.h, maxWidth: 40.w, minWidth: 25.w);
    return widget.isLoading
        ? SizedBox(
            height: (widget.hieght ?? 50), child: const MainProgressIndicator())
        : ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              final focusedBorder = UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular((widget.borderRadius ?? 12)),
                borderSide: BorderSide(
                    color: !widget.showBorder
                        ? Colors.white
                        : widget.borderColor ?? Colors.white),
              );
              final errorBorder = UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular((widget.borderRadius ?? 12)),
                borderSide: BorderSide(
                    color:
                        !widget.showBorder ? Colors.transparent : Colors.red),
              );
              final focusedErrorBorder = UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular((widget.borderRadius ?? 12)),
                borderSide: BorderSide(
                    color:
                        !widget.showBorder ? Colors.transparent : Colors.white),
              );
              return ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  maxLines: widget.maxLines ?? 1,
                  cursorColor: Co.orange,
                  controller: widget.controller,
                  enabled: widget.enabled,
                  style: !widget.enabled
                      ? TStyle.greySemi(14)
                      : widget.style ?? TStyle.blackSemi(14),
                  validator: widget.validator,
                  onChanged: widget.onChange,
                  onSaved: widget.onSubmitting,
                  obscureText: value,
                  inputFormatters: widget.inputFormatters != null
                      ? [widget.inputFormatters!]
                      : null,
                  keyboardType: widget.inputFormatters ==
                          FilteringTextInputFormatter.digitsOnly
                      ? TextInputType.number
                      : null,
                  decoration: InputDecoration(
                    errorStyle: TStyle.errorSemi(15),
                    hintText: widget.hintText,
                    hintStyle: widget.style ?? TStyle.greyRegular(12),
                    labelText: widget.label,
                    labelStyle: TStyle.greySemi(15),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    prefixIcon: widget.prefix == null
                        ? null
                        : widget.prefixOnTap == null
                            ? Padding(
                                padding: EdgeInsets.all(5
                                    // right: context.read<SettingsCubit>().isEn ? 5.r : 0,
                                    // left: context.read<SettingsCubit>().isEn ? 0 : 5.r,
                                    ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Co.orange,
                                      borderRadius: AppConsts.defaultRadius),
                                  child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: widget.prefix),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    right: L10n.isAr(context) ? 0 : 5,
                                    left: L10n.isAr(context) ? 5 : 0),
                                child: MaterialButton(
                                    minWidth: 20,
                                    onPressed: widget.prefixOnTap ?? () {},
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: AppConsts.defaultRadius),
                                    color: Co.orange,
                                    child: widget.prefix),
                              ),

                    // suffixIconConstraints: iconContraints,

                    suffix: widget.suffixWidget,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: getSiffixIcon(value),
                    ),

                    filled: widget.isFilled || widget.bgColor != null,

                    fillColor: widget.bgColor ?? Co.white,
                    focusedBorder: focusedBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: focusedErrorBorder,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(
                    //       (widget.borderRadius ?? AppConsts.defaultBorderRadius)
                    //           .h),
                    //   borderSide: BorderSide(
                    //       color: !widget.showBorder
                    //           ? Colors.transparent
                    //           : widget.borderColor ?? Co.white),
                    // ),
                    //   borderSide: BorderSide(
                    //       color: !widget.showBorder
                    //           ? Colors.transparent
                    //           : widget.foucusedColor ??
                    //               Co.grey.withOpacity(0.25)),
                    // ),
                    // disabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(
                    //       (widget.borderRadius ?? AppConsts.defaultBorderRadius)
                    //           .h),
                    //   borderSide: BorderSide(
                    //       color: widget.borderColor ?? Colors.transparent),
                    // ),

                    // focusedBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // focusedErrorBorder: InputBorder.none,
                  ),
                ),
              );
            },
          );
  }

  Widget? getSiffixIcon(value) {
    if (widget.suffix != null) return widget.suffix;
    if (widget.isPassword) {
      return InkWell(
        onTap: () => isObscure.value = !value,
        child: Icon(
          value ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
          color: Co.lightGrey,
          size: 20,
        ),
      );
    }
    if (widget.isValid == null) return null;
    if (widget.isValid == true) {
      return const Icon(
        CupertinoIcons.check_mark_circled,
        color: Co.orange,
      );
    } else {
      return const Icon(
        CupertinoIcons.xmark_circle,
        color: Co.red,
      );
    }
  }
}
