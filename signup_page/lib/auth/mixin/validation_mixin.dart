import 'package:easy_localization/easy_localization.dart';

mixin ValidationMixin {
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return tr('name_required');
    }
    if (!value.startsWith(RegExp(r'[A-Z]'))) {
      return tr('name_capital');
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return tr('email_required');
    }
    if (!value.contains('@')) {
      return tr('email_invalid');
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return tr('password_length');
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return tr('password_mismatch');
    }
    return null;
  }
}
