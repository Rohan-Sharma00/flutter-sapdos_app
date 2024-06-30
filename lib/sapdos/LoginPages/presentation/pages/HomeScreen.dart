import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/pages/DoctorHomePage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/LoginPage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/RegistrationPagePatient.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
            ),
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
              Text("Login to your sapdos account",
                  style: Theme.of(context).textTheme.displaySmall),
              Text("create one now",
                  style: Theme.of(context).textTheme.displaySmall),
              SizedBox(
                height: MediaQuery.of(context).size.height / 11,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                // height: 20,
                child: Column(
                  children: [
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
                         context.go('/login');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.65,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          context.go('/patientRegistration');
                        },
                        child: Text(
                          "SIGN-UP",
                          style: TextStyle(color: Color(0xFF13235A)),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                        
                        },
                        child: Text(
                          "Proceed as a Guest",
                          style: TextStyle(
                            color: Color(0xFF13235A),
                            decoration: TextDecoration.underline,
                          ),
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
