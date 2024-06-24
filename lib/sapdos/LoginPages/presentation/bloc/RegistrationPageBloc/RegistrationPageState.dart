import 'package:flutter/material.dart';

abstract class RegistrationPageStates {}

class RegistrationPageInitialState extends RegistrationPageStates {}

class RegistrationPageEmailState extends RegistrationPageStates {
  final String message;
  final Color textColor;
  RegistrationPageEmailState(this.message, [this.textColor = Colors.red]);
}

class RegistrationPagePasswordState extends RegistrationPageStates {
  final String message;
  final Color textColor;

  RegistrationPagePasswordState(this.message, [this.textColor = Colors.red]);
}

class RegistrationPageConfirmPasswordState extends RegistrationPageStates {
  final String message;
  final Color textColor;

  RegistrationPageConfirmPasswordState(this.message,
      [this.textColor = Colors.red]);
}

class RegistrationPageResponseState extends RegistrationPageStates {
  final String message;
  final Color textColor;

  RegistrationPageResponseState(this.message,
      [this.textColor = Colors.red]);
}

class RegistrationSuccessState extends RegistrationPageStates {
  
}

