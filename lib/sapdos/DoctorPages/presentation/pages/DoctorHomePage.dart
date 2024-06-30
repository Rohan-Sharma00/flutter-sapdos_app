import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/DoctorHomePageBloc/DoctorHomePageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/DoctorHomePageBloc/DoctorHomePageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/bloc/DoctorHomePageBloc/DoctorHomePageStates.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageStates.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/SapdosSideBar.dart';
import 'package:go_router/go_router.dart';

class DoctorHomePage extends StatelessWidget {
  LoginCredentials loginDetails = new LoginCredentials();
  PersonCredentials credentials = PersonCredentials.emptyObj();
  AllAppointmentEntity appointment = AllAppointmentEntity.getEmptyAppointment();

  DoctorHomePage({required this.loginDetails});


  Container Boxes() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF7E91D4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${appointment.pendingAppointment}',
                            style: TextStyle(
                                color: Color(0xFF13235A), fontSize: 20)),
                        TextSpan(
                            text: '/${appointment.totalAppointment}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  Text(
                    "Pending Appoinments",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF7E91D4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '${appointment.completedAppointment}',
                              style: TextStyle(
                                  color: Color(0xFF13235A), fontSize: 20)),
                          TextSpan(
                              text: '/${appointment.totalAppointment}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                    Text(
                      "Completed Appoinments",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row firstContainer() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello !",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                credentials.name ?? "doctor name",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50),
              ),
            ],
          ),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZYHmzPOG6kpyTzARYBwFgOG9b8aMj8fbu9PZvGnH9kovZWcSO'),
          )
        ]);
  }

  Container BlueLine() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF13235A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 100),
              child: Row(
                children: [
                  Text(
                    "Wednesday, March 7",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.calendar_today, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    switch (colorString) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  Container appointments(BuildContext context) {
  
    return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
          itemCount: appointment.patientList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.go("/patient/${appointment.patientList[index].patientUId}");
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.timer,
                        color: appointment.patientList[index].treated ? Colors.green : Colors.red
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(appointment.patientList[index].slotTime ,
                          style: TextStyle(fontSize: 22)),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: 
                                             appointment.patientList[index].treated ? Colors.green : Colors.red ,
                                          width: 1.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  margin: EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Container(
                                          child: Text(
                                            "Patient Name : ${appointment.patientList[index].name }",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
                                      ),
                                      // Text(patientData[index]["age"] ?? "",
                                      //     style: TextStyle(fontSize: 17)),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child:
                                           appointment.patientList[index].treated
                                                ? Icon(Icons.check)
                                                : Icon(Icons.pending),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget build(BuildContext context) {
    print(
        "in doctor home page logincredentials = ${loginDetails.id} = ${loginDetails.role}");
    return BlocProvider(
      create: (context) => DoctorHomePageBloc()
        ..add(DoctorHomePageInitialEvent(credentails: loginDetails)),
      child: BlocBuilder<DoctorHomePageBloc, DoctorHomePageStates>(
          builder: (context, state) {
        if (state is DoctorLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorErrorState) {
          return Center(
              child: Text(
            state.message,
            style: TextStyle(
              color: state.textColor,
              fontSize: 20,
            ),
          ));
        } else if (state is DoctorHomePageInitialSuccessState) {

          credentials = state.person;
          appointment = state.appointment;
          print("doctor credentials = ${credentials.toString()}");
          print("doctor appointment = ${appointment.toString()}");
          return Container(child: mainDoctorPage(context));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  BlocProvider mainDoctorPage(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorHomePageBloc()
        ..add(DoctorHomePageInitialEvent(credentails: loginDetails)),
      child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Color(0xFF13235A),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            child: Text(
                              "SAPDOS",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white, fontSize: 60),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Center(child: DoctorSideBar()),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Expanded(
                            child: Column(children: [
                          FractionallySizedBox(
                              widthFactor: 0.85, child: firstContainer()),
                          SizedBox(height: 20),
                          FractionallySizedBox(
                            widthFactor: 0.85,
                            child: Positioned(
                              left: 5,
                              child: const Text(
                                "Today's Appointment ",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                              widthFactor: 0.85, child: Boxes()),
                          SizedBox(height: 20),
                          FractionallySizedBox(
                              widthFactor: 0.85, child: BlueLine()),
                          SizedBox(height: 15),
                          Expanded(
                            child: FractionallySizedBox(
                                widthFactor: 0.85, child: appointments(context)),
                          ),
                        ]))))
              ]))),
    );
  }
}
