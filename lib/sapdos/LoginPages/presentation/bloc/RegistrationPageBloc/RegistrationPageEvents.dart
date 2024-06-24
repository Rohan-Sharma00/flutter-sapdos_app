import 'package:flutter/material.dart';

abstract class RegistrationPageEvents {}

class RegistrationPageEmailEvent extends RegistrationPageEvents {
  final String email;
  final Color textColor;
  RegistrationPageEmailEvent(this.email,{this.textColor=Colors.red});
}

class RegistrationPagePasswordEvent extends RegistrationPageEvents {
  final String password;
    final Color textColor;

  RegistrationPagePasswordEvent(this.password,{this.textColor=Colors.red});
}

class RegistrationPageConfirmPasswordEvent extends RegistrationPageEvents {
  final String password;
  final String confirmPassword;
    final Color textColor;

  RegistrationPageConfirmPasswordEvent(this.password,this.confirmPassword,{this.textColor=Colors.red});
}

class RegistrationPageSubmitEvent extends RegistrationPageEvents {
  final String email;
  final String password;
  RegistrationPageSubmitEvent(this.email, this.password);
}

