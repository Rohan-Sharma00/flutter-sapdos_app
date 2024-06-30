import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/useCase/UseCase.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageStates.dart';
import 'package:flutter_sapdos_app/sapdos/utils/FetchPersonDetails.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class PatientHomePageBloc
    extends Bloc<PatientHomePageEvents, PatientHomePageStates> {
  PatientHomePageBloc() : super(PatientHomePageInitialState()) {

    on<PatientHomePageInitialEvent>((event, emit) async{
      UseCase obj= new UseCase();
      List<PersonCredentials> list= await obj.fetchDoctors();
      PersonCredentials person=await FetchPersonDetails(event.credentails);
      print("in patient bloc data arrived = ${list[0].toString()}");
            print("in patient bloc data arrived = ${person.toString()}");

       emit(PatientHomePageInitialSuccessState(credentials: list,person: person));
    });
  }
}
