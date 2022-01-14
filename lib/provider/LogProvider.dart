import 'dart:collection';
import 'package:assinment/constant/constants.dart';
import 'package:assinment/model/Validate.dart';
import 'package:flutter/material.dart';


class LogController extends ChangeNotifier {

  var email = TextEditingController();
  var name = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String countryCode = "+91";
  String emergencyPhoneCountryCode = "+91";


  clearTextControllers() {
    email.clear();
    password.clear();
    notifyListeners();
  }

  showErrorMessage(String key,
      {required String errorMessage, bool popOut = false}) async {
    validationMessage[key] = errorMessage;
    notifyListeners();
    await delay(3);
    validationMessage.clear();
    notifyListeners();
  }

  showErrorMessageAndPop(context, String key, {required String errorMessage}) async {
    validationMessage[key] = errorMessage;
    notifyListeners();
    pop(context);
    await delay(5);
    validationMessage.clear();
    notifyListeners();
  }



  final validationLog = LinkedHashMap();
  final validationMessage = LinkedHashMap();

  Validate validate = Validate();

  bool isNextButtonDisabled = false;

  String passwordMatchValidation() {
    if (validationLog["password"] == true &&
        validationLog["confirmPassword"] == true) {
      return validationMessage["passwordMatch"];
    } else {
      return validationMessage["password"];
    }
  }

  validateSignInData(context) {
    FocusScope.of(context).unfocus();
    validationLog.clear();
    validationLog["email"] = validate.email(email.text, onFailed: (errMsg) {
      showErrorMessage("email", errorMessage: errMsg);
    });
    validationLog["password"] =
        validate.password(password.text, onFailed: (errMsg) {
      showErrorMessage("password", errorMessage: errMsg);
    });
    bool isReadyToVerifyNumber = true;
    //loop through validation log and check if all validation are true
    validationLog.forEach((key, value) {
      print(value);
      if (value == false) {
        isReadyToVerifyNumber = false;
      }
    });
    if (isReadyToVerifyNumber) {
      // signIn(context);
      // push(context, Routes.landingPage);
    }
  }


}
