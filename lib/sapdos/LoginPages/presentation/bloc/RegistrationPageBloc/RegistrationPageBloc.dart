import 'dart:js_interop';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/useCase/RegistrationUseCase.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageState.dart';

class RegistrationPageBloc
    extends Bloc<RegistrationPageEvents, RegistrationPageStates> {
  RegistrationPageBloc() : super(RegistrationPageInitialState()) {
    on<RegistrationPageEmailEvent>((event, emit) {
      if (EmailValidator.validate(event.email)) {
        emit(RegistrationPageEmailState(
            "Email address validated successfully", Colors.green));
      } else {
        emit(RegistrationPageEmailState("Enter valid Email Address"));
      }
    });

    on<RegistrationPagePasswordEvent>((event, emit) {
      if (event.password.length > 5) {
        emit(RegistrationPagePasswordState(
            "Password is validated", Colors.green));
      } else {
        emit(RegistrationPagePasswordState(
            "password length should be more than 5"));
      }
    });

    on<RegistrationPageConfirmPasswordEvent>((event, emit) {
      if (event.password==event.confirmPassword) {
        emit(RegistrationPageConfirmPasswordState(
            "Password matched", Colors.green));
      } else {
        emit(RegistrationPageConfirmPasswordState(
            "password is not matching with confirm password"));
      }
    });

 on<RegistrationPageSubmitEvent>((event, emit) async  {
     
emit(RegistrationPageResponseState("please wait...",Colors.yellow));
      RegistrationUseCase lcase=new RegistrationUseCase();
      final result = await lcase.call(event.email,event.password);

     if(result.isRight()==true)
     {
      // emit(RegistrationPageResponseState("Registration successful",Colors.green));
      emit(RegistrationSuccessState());
     }
     else
     {
      emit(RegistrationPageResponseState("Registration failed something went wrong",Colors.red));
     
     }

    });

  }
}
