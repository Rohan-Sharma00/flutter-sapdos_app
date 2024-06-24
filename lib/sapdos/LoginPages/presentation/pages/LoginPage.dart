import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/pages/DoctorPage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageStates.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/RegistrationPage.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/DoctorDetailsPage.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientHomePage.dart';

class LoginPage extends StatelessWidget {
  bool isChecked = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Text styledText(String message, String color) {
    Color textColor = Colors.black;

    if (color.toLowerCase() == 'green') {
      textColor = Colors.green;
    } else if (color.toLowerCase() == 'red') {
      textColor = Colors.red;
    }
    return Text(
      message,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Row(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(
            "assets/doctor.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Text(
                "SAPDOS",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Text("Welcome Back",
                  style: Theme.of(context).textTheme.displayMedium),
              Text("Enter existing account's detail",
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height / 27,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: [
                    BlocBuilder<LoginPageBloc, LoginPageStates>(
                      builder: (context, state) {
                        if (state is LoginPageEmailErrorState) {
                          return styledText(state.message, "red");
                        }
                        if (state is LoginPageEmailValidState) {
                          return styledText(state.message, "green");
                        }
                        return Container();
                      },
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: TextField(
                        controller: emailController,
                        onChanged: (val) {
                          BlocProvider.of<LoginPageBloc>(context)
                              .add(LoginPageEmailEvent(emailController.text));
                        },
                        decoration: InputDecoration(
                            hintText: "Email address/ Phone no",
                            hintStyle: TextStyle(fontSize: 12),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF13235A)),
                            )),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    BlocBuilder<LoginPageBloc, LoginPageStates>(
                      builder: (context, state) {
                        if (state is LoginPagePasswordErrorState) {
                          return styledText(state.message, "red");
                        }
                        if (state is LoginPagePasswordValidState) {
                          return styledText(state.message, "green");
                        }
                        return Container();
                      },
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (val) {
                          BlocProvider.of<LoginPageBloc>(context).add(
                              LoginPagePasswordEvent(passwordController.text));
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 12),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF13235A)),
                            )),
                      ),
                    )),
                    FractionallySizedBox(
                      widthFactor: 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  value: isChecked,
                                  onChanged: (value) => {},
                                  visualDensity: VisualDensity(
                                    horizontal: -2.0,
                                    vertical: -2.0,
                                  ),
                                ),
                              ),
                              Text("Remember me",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: 10)),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text("Forgot Password",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            fontSize: 10,
                                            decoration:
                                                TextDecoration.underline)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF13235A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<LoginPageBloc>(context).add(
                              LoginPageSubmitEvent(emailController.text,
                                  passwordController.text));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                  

                    BlocConsumer<LoginPageBloc, LoginPageStates>(
                        builder: (context, state) {
                      return Container();
                    }, listener: (context, state) {
                      if (state is LoginPageSuccessStatusState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientHomePage()));
                      }
                    }),

                    BlocBuilder<LoginPageBloc, LoginPageStates>(
                      builder: (context, state) {
                        if (state is LoginPageStatusState) {
                          return Container(
                              child: styledText(state.message, "red"));
                        }
                      
                        return Container();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                    ),
                    Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not on sapdos?"),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider(
                              create: (context) => RegistrationPageBloc(),
                              child: RegistrationPage(),
                            );
                                }));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Color(0xFF13235A),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]))
      ]),
    ));
  }
}
