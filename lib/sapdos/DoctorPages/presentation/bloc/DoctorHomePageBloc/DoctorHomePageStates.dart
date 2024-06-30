import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorHomePageStates{

}

class DoctorHomePageInitialState extends DoctorHomePageStates {
 
}

class DoctorHomePageInitialSuccessState extends DoctorHomePageStates {
 AllAppointmentEntity appointment;
 PersonCredentials person;
 DoctorHomePageInitialSuccessState({required this.appointment,required this.person});

}

class DoctorLoadingState extends DoctorHomePageStates {

}

class DoctorErrorState extends DoctorHomePageStates {
 final String message;
  final Color textColor;

  DoctorErrorState(this.message,
      [this.textColor = Colors.red]);
}

