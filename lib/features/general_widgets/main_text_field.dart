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
    return widget.isLoading
        ? SizedBox(height: (widget.hieght ?? 50), child: const MainProgressIndicator())
        : ValueListenableBuilder(
            valueListenable: isObscure,
            builder: (context, value, child) {
              final focusedBorder = OutlineInputBorder(
                borderRadius: AppConsts.defaultRadius,
                borderSide: BorderSide(
                    color: !widget.showBorder ? Co.yellow : widget.borderColor ?? Co.yellow),
              );
              final errorBorder = OutlineInputBorder(
                borderRadius: AppConsts.defaultRadius,
                borderSide: BorderSide(color: !widget.showBorder ? Co.yellow : Colors.red),
              );
              final focusedErrorBorder = OutlineInputBorder(
                borderRadius: AppConsts.defaultRadius,
                borderSide: BorderSide(color: !widget.showBorder ? Co.yellow : Co.yellow),
              );
              return ClipRRect(
                borderRadius: AppConsts.defaultRadius,
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  maxLines: widget.maxLines ?? 1,
                  cursorColor: Co.orange,
                  controller: widget.controller,
                  enabled: widget.enabled,
                  style:
                      !widget.enabled ? TStyle.greySemi(14) : widget.style ?? TStyle.blackSemi(14),
                  validator: widget.validator,
                  onChanged: widget.onChange,
                  onSaved: widget.onSubmitting,
                  obscureText: value,
                  inputFormatters:
                      widget.inputFormatters != null ? [widget.inputFormatters!] : null,
                  keyboardType: widget.inputFormatters == FilteringTextInputFormatter.digitsOnly
                      ? TextInputType.number
                      : null,
                  decoration: InputDecoration(
                    errorStyle: TStyle.errorSemi(14),
                    hintText: widget.hintText,
                    hintStyle: widget.style ?? TStyle.greyRegular(12),
                    labelText: widget.label,
                    labelStyle: TStyle.greySemi(15),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    prefixIcon: widget.prefix == null
                        ? null
                        : widget.prefixOnTap == null
                            ? Padding(
                                padding: const EdgeInsets.all(5),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Co.orange, borderRadius: AppConsts.defaultRadius),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8), child: widget.prefix),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    right: L10n.isAr(context) ? 0 : 5,
                                    left: L10n.isAr(context) ? 5 : 0),
                                child: MaterialButton(
                                    minWidth: 20,
                                    onPressed: widget.prefixOnTap ?? () {},
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: AppConsts.defaultRadius),
                                    color: Co.orange,
                                    child: widget.prefix),
                              ),
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
                    enabledBorder: focusedBorder,
                    disabledBorder: focusedBorder,
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
          color: Co.grey,
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
