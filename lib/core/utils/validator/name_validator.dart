import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

enum NameValidationError {
  invalid,
  empty,
  phoneNumber,
  plateNumber,
}

class NameValidator extends FormzInput<String, NameValidationError> {
  const NameValidator.pure() : super.pure('');

  const NameValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  NameValidationError? validator(
    String? value, {
    bool? checkPhoneNumber,
    bool? plateNumber,
  }) {
    if ((checkPhoneNumber ?? false) &&
        (value ?? '').length != phoneNumberLenghtDRC) {
      return NameValidationError.phoneNumber;
    }

    if (plateNumber == true && (value ?? '').isNotEmpty) {
      final RegExp regex = RegExp(r'^[a-zA-Z0-9]{4,}$');
      var hasMath = regex.hasMatch(value!);
      if (hasMath == false) {
        return NameValidationError.plateNumber;
      }
    }

    return value!.isNotEmpty == true ? null : NameValidationError.empty;
  }
}

extension NameValidationErrorX on NameValidationError {
  String text(BuildContext context) {
    switch (this) {
      case NameValidationError.invalid:
        return context.tr(LocaleKeys.please_valid_name);
      case NameValidationError.empty:
        return context.tr(LocaleKeys.please_fill_this_field);
      case NameValidationError.phoneNumber:
        return context.tr(LocaleKeys.please_valid_phone);
      case NameValidationError.plateNumber:
        return context.tr(LocaleKeys.enter_valid_plate_number);
    }
  }
}
