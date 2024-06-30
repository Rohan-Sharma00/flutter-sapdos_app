import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';

abstract class LoginPageStates{}

class LoginPageInitialState extends LoginPageStates{

}

class LoginPageEmailErrorState extends LoginPageStates{
final String message;
LoginPageEmailErrorState(this.message);
}

class LoginPageEmailValidState extends LoginPageStates{
final String message;
LoginPageEmailValidState(this.message);
}

class LoginPagePasswordErrorState extends LoginPageStates{
final String message;
LoginPagePasswordErrorState(this.message);
}

class LoginPagePasswordValidState extends LoginPageStates{
final String message;
LoginPagePasswordValidState(this.message);
}

class LoginPageStatusState extends LoginPageStates{
final String message;
final String textColor;
LoginPageStatusState(this.message ,[this.textColor = "red"]);
}

class LoginPageSuccessStatusState extends LoginPageStates{
final LoginCredentials credentails;
LoginPageSuccessStatusState(this.credentails);
}

