import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class PatientHomePageStates{

}

class PatientHomePageInitialState extends PatientHomePageStates {
 
}

class PatientHomePageInitialSuccessState extends PatientHomePageStates {
 List<PersonCredentials> credentials;
 PersonCredentials person;
 PatientHomePageInitialSuccessState({required this.credentials,required this.person});

}

class LoadingState extends PatientHomePageStates {

}

class ErrorState extends PatientHomePageStates {
 final String message;
  final Color textColor;

  ErrorState(this.message,
      [this.textColor = Colors.red]);
}

