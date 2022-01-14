
class Validate {
  passwordAndEmail(String value, {required Function(String errorMessage) onFailed}) {
    bool validation;
    if (value == null || value.isEmpty) {
      validation = false;
      onFailed("Cannot be empty");
    } else {
      if (containNumbers(value)) {
        String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
        RegExp regExp = new RegExp(pattern);
        validation = regExp.hasMatch(value) ? true : false;
        if (validation == false) {
          onFailed("Invalid phone number");
        }
      } else {
        String pattern = r'^[a-zA  -Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
        RegExp regExp = new RegExp(pattern);
        validation = regExp.hasMatch(value) ? true : false;
        if (validation == false) {
          onFailed("Invalid email address");
        }
      }
    }
    return validation;
  }

  isEmpty(String value, {required Function(String errorMessage) onFailed}) {
    bool validation;
    if (value.isEmpty) {
      validation = false;
      onFailed("Cannot be empty");
    } else {
      validation = true;
    }
    return validation;
  }

  isNull(value, {required Function(String value) onFailed}) {
    bool validation;
    if (value == null) {
      validation = false;
      onFailed("Cannot be empty");
    } else {
      validation = true;
    }
    return validation;
  }

  email(String value, {required Function(String errorMessage) onFailed}) {
    bool validation;
    String pattern = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
    RegExp regExp = new RegExp(pattern);
    validation = regExp.hasMatch(value) ? true : false;
    if (value.isEmpty) {
      onFailed("Email cannot be empty");
    } else {
      if (validation == false) {
        onFailed("Invalid email address");
      }
    }
    return validation;
  }

  phone(String value, {required Function(String errorMessage) onFailed}) {
    bool validation;
    String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    RegExp regExp = new RegExp(pattern);
    validation = regExp.hasMatch(value) ? true : false;
    if (value.isEmpty) {
      onFailed("Phone number cannot be empty");
    } else {
      if (validation == false) {
        onFailed("Invalid phone number");
      }
    }
    return validation;
  }

  password(String value, {required Function(String errorMessage) onFailed}) {
    bool validation;
    if (value.isEmpty) {
      validation = false;
      onFailed("Password cannot be empty");
    } else {
      if (value.length < 6) {
        validation = false;
        onFailed("Password too short");
      } else {
        validation = true;
      }
    }
    return validation;
  }

  passwordMatches(
      {required String value1, required String value2, required Function(String errorMessage) onFailed}) {
    bool validation = false;
    if (value1 == value2) {
      validation = true;
    } else {
      validation = false;
      onFailed("Password doesn't match");
    }
    return validation;
  }

  containNumbers(String str) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
  }
}
