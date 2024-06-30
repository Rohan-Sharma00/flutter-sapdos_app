import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/useCase/UseCase.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageStates.dart';


class DoctorDetailsPageBloc
    extends Bloc<DoctorDetailsPageEvents, DoctorDetailsPageStates> {
  DoctorDetailsPageBloc() : super(DoctorDetailsPageInitialState()) {

    on<DoctorDetailsPageSlotsEvent>((event, emit) async{
      UseCase obj= new UseCase();
      List<AvailabilitySlot> list= await obj.CallAvailabilitySlot(event.id);
       emit(DoctorDetailsPageSlotsState(credentials: list));
    });
  }
}
