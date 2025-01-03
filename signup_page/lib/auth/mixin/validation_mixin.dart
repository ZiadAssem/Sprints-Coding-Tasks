
mixin ValidationMixin {
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    if (!value.startsWith(RegExp(r'[A-Z]'))) {
      return 'Name must start with a capital letter';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
