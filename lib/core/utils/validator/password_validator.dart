import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

enum PasswordValidationError { invalid, empty, weak, noSame }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value, {String? second}) {
    if (second != null && second != value) {
      return PasswordValidationError.noSame;
    }

    // if (estimatePasswordStrength(value!) < 0.1) {
    //   return PasswordValidationError.weak;
    // }
    return value!.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}

extension PasswordValidationErrorX on PasswordValidationError {
  String text(BuildContext context) {
    switch (this) {
      case PasswordValidationError.invalid:
        return context.tr(LocaleKeys.please_valid_password);
      case PasswordValidationError.weak:
        return context.tr(LocaleKeys.password_short);
      case PasswordValidationError.empty:
        return context.tr(LocaleKeys.please_fill_this_field);
      case PasswordValidationError.noSame:
        return context.tr(LocaleKeys.password_not_same);
    }
  }
}
