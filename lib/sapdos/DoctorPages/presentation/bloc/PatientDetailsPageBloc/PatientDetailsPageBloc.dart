import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/useCase/UseCase.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/PatientDetailsPageBloc/PatientDetailsPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/PatientDetailsPageBloc/PatientDetailsPageStates.dart';

import 'package:flutter_sapdos_app/sapdos/utils/FetchPersonDetails.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class PatientDetailsPageBloc
    extends Bloc<PatientDetailsPageEvents, PatientDetailsPageStates> {
  PatientDetailsPageBloc() : super(PatientDetailsPageInitialState()) {
    on<PatientDetailsPageInitialEvent>((event, emit) async {
      UseCaseDoctor obj = new UseCaseDoctor();
      LoginCredentials credentials=LoginCredentials.LoginCredentialswithid(event.patientId);
      PersonCredentials person = await FetchPersonDetails(credentials);

      print("in Doctor bloc data arrived person=  ${person.toString()}");

      emit(PatientDetailsPageInitialSuccessState(person: person));
    });
  }
}
