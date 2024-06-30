import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/useCase/UseCase.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/DoctorHomePageBloc/DoctorHomePageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/DoctorHomePageBloc/DoctorHomePageStates.dart';

import 'package:flutter_sapdos_app/sapdos/utils/FetchPersonDetails.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorHomePageBloc
    extends Bloc<DoctorHomePageEvents, DoctorHomePageStates> {
  DoctorHomePageBloc() : super(DoctorHomePageInitialState()) {
    on<DoctorHomePageInitialEvent>((event, emit) async {
      UseCaseDoctor obj = new UseCaseDoctor();
      PersonCredentials person = await FetchPersonDetails(event.credentails);
      List<PersonCredentials> allPatientData = await obj.fetchAllPatients();

      print("in Doctor bloc data arrived = ${allPatientData[0].toString()}");
      print("in Doctor bloc data arrived = ${person.toString()}");

      emit(DoctorHomePageInitialSuccessState(
          allPatientData: allPatientData, person: person));
    });
  }
}
