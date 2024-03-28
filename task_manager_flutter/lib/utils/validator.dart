class FormValidator {
  
  static String? validatorRequired(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Cannot be left blank';
    }
    return null;
  }

  static String? validatorEmail(dynamic value) {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'Cannot be left blank';
    }
    if(regex.hasMatch(value) == false) {
      return 'Email invalidate';
    }
    return null;
  }

  static String? validatorPassword(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Cannot be left blank';
    }
    if(value.toString().length < 8) {
      return 'Password more than 8 characters';
    }
    return null;
  }

  static String? validatorConfirmPassword(dynamic value,String password) {
    if (value == null || value.isEmpty) {
      return 'Cannot be left blank';
    }
    if(value.toString().length < 8) {
      return 'Password more than 8 characters';
    }
    if(value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
