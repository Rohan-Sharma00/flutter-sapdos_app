import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/data/models/DoctorDataModel.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageStates.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientPageBookingAppointment.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

Container BlueLine(String name) {
  return Container(
    margin: EdgeInsets.all(0),
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 100),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Container blueLineMenu1(BuildContext context) {
  return Container(
      child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      color: Color(0xFF13235A),
      child: ExpansionTile(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 30,
          child: Center(child: BlueLine("Patient History")),
        ),
        children: <Widget>[
          Container(
            height: 10.0,
            color: Colors.white,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF13235A), width: 1),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "Blood Report",
                      style: TextStyle(color: Color(0xFF13235A)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.remove_red_eye))
                ],
              )),
          Container(
            height: 10.0,
            color: Colors.white,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF13235A), width: 1),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "CT Scan Report Report",
                      style: TextStyle(color: Color(0xFF13235A)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.remove_red_eye))
                ],
              )),
        ],
      ),
    ),
  ));
}


Container blueLineMenu2(BuildContext context) {
  return Container(
      child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      color: Color(0xFF13235A),
      child: ExpansionTile(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 30,
          child: Center(child: BlueLine("Prescription")),
        ),
        children: <Widget>[
          Container(
            height: 10.0,
            color: Colors.white,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF13235A), width: 1),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "26 March 2022",
                      style: TextStyle(color: Color(0xFF13235A)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.remove_red_eye))
                ],
              )),
          Container(
            height: 10.0,
            color: Colors.white,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF13235A), width: 1),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "13 April 2022",
                      style: TextStyle(color: Color(0xFF13235A)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.remove_red_eye))
                ],
              )),
        ],
      ),
    ),
  ));
}

class PatientDetailsPage extends StatelessWidget {
  final PersonCredentials patient =
      PersonCredentials.tpObj("shadow", "27", "hello world");
  // PatientDetailsPage(this.patient);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorDetailsPageBloc()
        ..add(DoctorDetailsPageSlotsEvent(patient.id ?? "null")),
      child: Scaffold(
          body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FractionallySizedBox(
                      widthFactor: 0.7,
                      heightFactor: 0.9,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF7E91D4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FractionallySizedBox(
                              widthFactor: 0.6,
                              heightFactor: 0.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.network(Constants.doctorImageUrl,
                                      fit: BoxFit.cover),
                                ),
                              )))),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                  child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            Container(
                                                child: Row(children: [
                                              Icon(Icons.person, size: 40),
                                              SizedBox(width: 6),
                                              Text(
                                                patient.name ?? "patient name",
                                                style: TextStyle(fontSize: 30),
                                              )
                                            ])),
                                          ],
                                        )),
                                        Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Container(
                                                    child: Row(children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    patient.age ?? "unknown",
                                                    style:
                                                        TextStyle(fontSize: 25),
                                                  )
                                                ])),
                                              ],
                                            ))
                                      ],
                                    )),
                                  ),
                                ],
                              )),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.only(left: 12),
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Issue Description :",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text(patient.description ?? "unknown"),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
          Expanded(
              child: Container(
                  child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: Container(
                          child: Column(
                        children: [
                          blueLineMenu1(context),
                          SizedBox(height: 10,),
                          blueLineMenu2(context),
                        ],
                      )))))
        ],
      )),
    );
  }
}
