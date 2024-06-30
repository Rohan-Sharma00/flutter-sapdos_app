import 'dart:js_interop';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
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
      if (event.password.length > 4) {
        emit(RegistrationPagePasswordState(
            "Password is validated", Colors.green));
      } else {
        emit(RegistrationPagePasswordState(
            "password length should be more than 5"));
      }
    });

    on<RegistrationPageMobileEvent>((event, emit) {
      if (event.mobile.length == 10 && int.tryParse(event.mobile) != null) {
        emit(RegistrationPageMobileState(
            "Mobile No is validated", Colors.green));
      } else {
        emit(RegistrationPageMobileState(
            "Mobile no length should be 10 and should contain digits only"));
      }
    });

    on<RegistrationPageAgeEvent>((event, emit) {
      int age = int.tryParse(event.age) ?? 0;
      if (age > 17) {
        emit(RegistrationPageAgeState("Age validated", Colors.green));
      } else {
        emit(RegistrationPageAgeState("Age should be greater or equal to 18"));
      }
    });

    on<RegistrationPageConfirmPasswordEvent>((event, emit) {
      if (event.password == event.confirmPassword) {
        emit(RegistrationPageConfirmPasswordState(
            "Password matched", Colors.green));
      } else {
        emit(RegistrationPageConfirmPasswordState(
            "password is not matching with confirm password"));
      }
    });

    on<RegistrationPageSubmitEvent>((event, emit) async {
      emit(RegistrationPageResponseState("please wait...", Colors.yellow));
      RegistrationUseCase lcase = new RegistrationUseCase();
      final result = await lcase.call(event.credential);
      print("registration presponse = ${result}");
      if (result.isRight() == true) {
        emit(RegistrationPageResponseState(
            "Registration Successfull", Colors.green));
      } else {
        emit(RegistrationPageResponseState(
            "Registration failed something went wrong", Colors.red));
      }
    });
  }
}
