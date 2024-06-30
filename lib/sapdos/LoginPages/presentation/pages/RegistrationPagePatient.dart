import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageState.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/LoginPage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/RegistrationPageDoctor.dart';
import 'package:go_router/go_router.dart';

class RegistrationPagePatient extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  var ageController = TextEditingController();
  var descriptionController = TextEditingController();
  var diseaseController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  PersonCredentials giveCredentials() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    var name =
        nameController.text.isNotEmpty ? nameController.text.trim() : null;
    var mobileNumber = mobileController.text.isNotEmpty
        ? mobileController.text.trim()
        : null;
    var address = addressController.text.isNotEmpty
        ? addressController.text.trim()
        : null;
    var age = ageController.text.isNotEmpty
        ? ageController.text.trim()
        : null;
    var description = descriptionController.text.isNotEmpty
        ? descriptionController.text.trim()
        : null;
    var disease = diseaseController.text.isNotEmpty
        ? diseaseController.text.trim()
        : null;

    return new PersonCredentials(
      email: email,
      password: password,
      name: name,
      mobileNumber: mobileNumber,
      address: address,
      age: age,
      description: description,
      disease: disease,
      role:"patient"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 9),
                      Center(
                        child: Text(
                          "SAPDOS",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 7),
                      Center(
                          child: Text("Register Patient",
                              style:
                                  Theme.of(context).textTheme.displayMedium)),
                      Center(
                        child: Text(
                          "Enter new account's details",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 27),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPageEmailState) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: emailController,
                            onChanged: (val) {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(RegistrationPageEmailEvent(
                                      emailController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPageMobileState) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: mobileController,
                            onChanged: (val) {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(RegistrationPageMobileEvent(
                                      mobileController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: "Address",
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPageAgeState) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: ageController,
                            onChanged: (val) {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(RegistrationPageAgeEvent(
                                      ageController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Age",
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: diseaseController,
                            decoration: InputDecoration(
                              hintText: "Disease",
                              prefixIcon: Icon(Icons.local_hospital),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPagePasswordState) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: passwordController,
                            onChanged: (val) {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(RegistrationPagePasswordEvent(
                                      passwordController.text));
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPageConfirmPasswordState) {
                            return Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: confirmPasswordController,
                            onChanged: (val) {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(RegistrationPageConfirmPasswordEvent(
                                      passwordController.text,
                                      confirmPasswordController.text));
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF13235A)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 19.0),
                      Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.45,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF13235A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<RegistrationPageBloc>(context)
                                  .add(
                                RegistrationPageSubmitEvent(giveCredentials()),
                              );
                            },
                            child: Text(
                              "SIGN-UP",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 17),
                      BlocBuilder<RegistrationPageBloc, RegistrationPageStates>(
                        builder: (context, state) {
                          if (state is RegistrationPageResponseState) {
                            return Container(
                                child: Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: state.textColor,
                                  fontSize: 15,
                                ),
                              ),
                            ));
                          }

                          return Container();
                        },
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already on SAPDOS?"),
                            InkWell(
                              onTap: () {
                                context.go('/login');

                              },
                              child: Text(
                                " Sign In",
                                style: TextStyle(
                                  color: Color(0xFF13235A),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                       SizedBox(height: 18,),
                            Center(
                              child: InkWell(
                                onTap: () {
                                 context.go('/doctorRegistration');
                                },
                                child: Text(
                                  "Register as doctor",
                                  style: TextStyle(
                                    color: Color(0xFF13235A),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
