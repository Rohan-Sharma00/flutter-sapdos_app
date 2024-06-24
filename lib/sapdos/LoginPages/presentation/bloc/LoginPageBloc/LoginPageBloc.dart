import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/repositories/login_repository_impl.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/useCase/LoginPageUseCase.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageStates.dart';



class LoginPageBloc extends Bloc<LoginPageEvents,LoginPageStates>{

LoginPageBloc() : super(LoginPageInitialState()){

on<LoginPageEmailEvent>((event,emit){
  
  if(EmailValidator.validate(event.email))
  {
      emit(LoginPageEmailValidState("Email address is validated"));
  }
  else
  {
     
      emit(LoginPageEmailErrorState("Email address is not valid"));
  }
  });

  on<LoginPagePasswordEvent>((event,emit)
  {
  
  if(event.password.length>5)
  {
      emit(LoginPagePasswordValidState("Password is validated"));
  }
  else
  {
     
      emit(LoginPagePasswordErrorState("Password is not a valid password"));
  }
  });


    on<LoginPageSubmitEvent>((event, emit) async {
      emit(LoginPageStatusState("please wait..."));
      final credential = LoginCredential(email: event.email, password: event.password);
      LoginUseCase lcase=new LoginUseCase();
      final result = await lcase.call(credential);
      print("*****api result = ${result}");

     if(result.isRight()==true)
     {
      emit(LoginPageSuccessStatusState("Login successful"));
     }
     else
     {
      emit(LoginPageStatusState("Login failed something went wrong"));
     
     }
    });
}
}