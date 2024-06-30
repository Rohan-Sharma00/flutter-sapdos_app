import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

abstract class RegistrationPageEvents {}

class RegistrationPageEmailEvent extends RegistrationPageEvents {
  final String email;
  final Color textColor;
  RegistrationPageEmailEvent(this.email,{this.textColor=Colors.red});
}

class RegistrationPageMobileEvent extends RegistrationPageEvents {
  final String mobile;
  final Color textColor;
  RegistrationPageMobileEvent(this.mobile,{this.textColor=Colors.red});
}

class RegistrationPageAgeEvent extends RegistrationPageEvents {
  final String age;
  final Color textColor;
  RegistrationPageAgeEvent(this.age,{this.textColor=Colors.red});
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
  final PersonCredentials credential;
  RegistrationPageSubmitEvent(this.credential);
}

