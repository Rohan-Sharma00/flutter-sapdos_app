import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class PatientDetailsPageStates{

}

class PatientDetailsPageInitialState extends PatientDetailsPageStates {
 
}

class PatientDetailsPageInitialSuccessState extends PatientDetailsPageStates {
 
 PersonCredentials person;
 PatientDetailsPageInitialSuccessState({required this.person});

}

class PatientLoadingState extends PatientDetailsPageStates {

}

class PatientErrorState extends PatientDetailsPageStates {
 final String message;
  final Color textColor;

  PatientErrorState(this.message,
      [this.textColor = Colors.red]);
}

