import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorHomePageStates{

}

class DoctorHomePageInitialState extends DoctorHomePageStates {
 
}

class DoctorHomePageInitialSuccessState extends DoctorHomePageStates {
 List<PersonCredentials> credentials;
 PersonCredentials person;
 DoctorHomePageInitialSuccessState({required this.credentials,required this.person});

}

class LoadingState extends DoctorHomePageStates {

}

class ErrorState extends DoctorHomePageStates {
 final String message;
  final Color textColor;

  ErrorState(this.message,
      [this.textColor = Colors.red]);
}

