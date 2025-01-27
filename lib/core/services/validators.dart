import 'package:pure_minds/config/localization/l10n/l10n.dart';

class AppRegex {
  static final RegExp emailValidatorRegExp = RegExp(r"^01[0125][0-9]{8}$");
}

class Validators {
  static String? notEmpty(String? value, {String? msg}) {
    if (value == null || value.isEmpty) {
      return msg ?? L10n.tr().thisFieldIsRequired;
    }
    return null;
  }

  static String? moreThanSix(String? value) {
    if (value == null || value.length < 6) {
      return L10n.tr().passwordLength;
    }
    return null;
  }

  static String? mobileNumberValidator(String? input) {
    if (input == null || input.isEmpty) {
      return L10n.tr().thisFieldIsRequired;
    }
    return !RegExp(r"^01(0|1|2|5)[0-9]{8}$").hasMatch(input) ? L10n.tr().invalidPhoneNumber : null;
  }

  static String? emailValidator(String? input) {
    if (input == null || input.isEmpty) {
      return L10n.tr().thisFieldIsRequired;
    }
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[^\s@]+\.[a-zA-Z]+").hasMatch(input) ? L10n.tr().invalidEmail : null;
  }
}
