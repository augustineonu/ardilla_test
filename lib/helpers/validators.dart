import 'dart:async';

import 'package:email_validator/email_validator.dart';

mixin Validators {

  String? validateEmail(String? email) {
    if (!(EmailValidator.validate(email!))) {
      return "Invalid Email";
    }
    return null;
  }

  // Validate Name
  String? validateName(String? name) {
    if (name!.length < 2) {
      return "Name too short";
    }
    return null;
  }

  String? validateEmptyField(String? value) {
    if (value!.isEmpty) {
      return "Please enter some text";
    }
    return null;
  }
  String? validatePhoneField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number cannot be empty';
  }
  if (value.length != 11) {
    return 'Phone number must be 11 digits';
  }
  return null;
}


  String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return "Please enter a password";
  }
  
  // Password should be at least 8 characters long
  if (password.length < 8) {
    return "Password must be at least 8 characters long";
  }
  
  // Password should contain at least one uppercase letter, one lowercase letter, one number, and one special character
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
  if (!passwordRegex.hasMatch(password)) {
    return "Password should contain at least one uppercase letter, one lowercase letter, one number, and one special character";
  }
  
  return null;
}

}
