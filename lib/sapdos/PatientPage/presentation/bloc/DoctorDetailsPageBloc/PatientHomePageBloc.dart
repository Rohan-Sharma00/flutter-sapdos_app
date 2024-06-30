// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/useCase/UseCase.dart';
// import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageEvents.dart';
// import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageStates.dart';
// import 'package:flutter_sapdos_app/sapdos/utils/loginCredential.dart';

// class PatientHomePageBloc
//     extends Bloc<PatientHomePageEvents, PatientHomePageStates> {
//   PatientHomePageBloc() : super(PatientHomePageInitialState()) {

//     on<PatientHomePageInitialEvent>((event, emit) async{
//       PatientHomePageUseCase obj= new PatientHomePageUseCase();
//       List<PersonCredentials> list= await obj.call();
//        emit(PatientHomePageInitialSuccessState(credentials: list));
//     });
//   }
// }
