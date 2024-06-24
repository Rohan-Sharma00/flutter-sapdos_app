import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageState.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/LoginPage.dart';

class RegistrationPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

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
              Text("Register",
                  style: Theme.of(context).textTheme.displayMedium),
              Text("Enter new account's detail",
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height / 27,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: [
                    BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                      builder: (context, state) {
                        if (state is RegistrationPageEmailState) {
                          return Text(
                            state.message,
                            style: TextStyle(
                              color: state.textColor,
                              fontSize: 15,
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: TextField(
                        onChanged: (val) {
                          BlocProvider.of<RegistrationPageBloc>(context).add(
                              RegistrationPageEmailEvent(emailController.text));
                        },
                        controller: emailController,
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
                    BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                      builder: (context, state) {
                        if (state is RegistrationPagePasswordState) {
                          return Text(
                            state.message,
                            style: TextStyle(
                              color: state.textColor,
                              fontSize: 15,
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: TextField(
                        onChanged: (val) {
                          BlocProvider.of<RegistrationPageBloc>(context).add(
                              RegistrationPagePasswordEvent(
                                  passwordController.text));
                        },
                        controller: passwordController,
                        obscureText: true,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                      builder: (context, state) {
                        if (state is RegistrationPageConfirmPasswordState) {
                          return Text(
                            state.message,
                            style: TextStyle(
                              color: state.textColor,
                              fontSize: 15,
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: TextField(
                        onChanged: (val) {
                          BlocProvider.of<RegistrationPageBloc>(context).add(
                              RegistrationPageConfirmPasswordEvent(
                                  passwordController.text,
                                  confirmPasswordController.text));
                        },
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(fontSize: 12),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF13235A)),
                            )),
                      ),
                    )),
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
                          BlocProvider.of<RegistrationPageBloc>(context).add(
                              RegistrationPageSubmitEvent(emailController.text,
                                  passwordController.text));
                        },
                        child: Text(
                          "SIGN-UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                    ),
                    BlocConsumer<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                      return Container();
                    }, listener: (context, state) {
                      if (state is RegistrationSuccessState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   BlocProvider(
                                    create: (context) => LoginPageBloc(),
                                    child: LoginPage(),
                                  )));
                      }
                    }),
                    BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                      builder: (context, state) {
                        if (state is RegistrationPageResponseState) {
                          return Container(
                              child:   Text(
                            state.message,
                            style: TextStyle(
                              color: state.textColor,
                              fontSize: 15,
                            ),
                          )
                              );
                        }

                        return Container();
                      },
                    ),
                    Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("already on sapdos?"),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider(
                                    create: (context) => LoginPageBloc(),
                                    child: LoginPage(),
                                  );
                                }));
                              },
                              child: Text(
                                "Sign In",
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
