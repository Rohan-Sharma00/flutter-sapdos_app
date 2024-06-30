import 'package:flutter/material.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorDetailsPageStates{

}

class  DoctorDetailsPageInitialState extends DoctorDetailsPageStates {
 
}

class DoctorDetailsPageSlotsState extends DoctorDetailsPageStates {
 List<AvailabilitySlot> credentials;
 DoctorDetailsPageSlotsState({required this.credentials});

}

class LoadingState extends DoctorDetailsPageStates {

}

class ErrorState extends DoctorDetailsPageStates {
 final String message;
  final Color textColor;

  ErrorState(this.message,
      [this.textColor = Colors.red]);
}

