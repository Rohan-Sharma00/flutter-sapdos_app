import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorHomePageStates{

}

class DoctorHomePageInitialState extends DoctorHomePageStates {
 
}

class DoctorHomePageInitialSuccessState extends DoctorHomePageStates {
 List<PersonCredentials> allPatientData;
 PersonCredentials person;
 DoctorHomePageInitialSuccessState({required this.allPatientData,required this.person});

}

class DoctorLoadingState extends DoctorHomePageStates {

}

class DoctorErrorState extends DoctorHomePageStates {
 final String message;
  final Color textColor;

  DoctorErrorState(this.message,
      [this.textColor = Colors.red]);
}

