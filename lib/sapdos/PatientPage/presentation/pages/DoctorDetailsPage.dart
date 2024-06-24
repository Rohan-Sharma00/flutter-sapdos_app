import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/data/models/DoctorDataModel.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientPageBookingAppointment.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var timings = [
  "10:00 AM to 10:15 AM",
  "10:15 AM to 10:30 AM",
  "10:30 AM to 10:45 AM",
  "10:45 AM to 11:00 AM",
  "11:00 AM to 11:15 AM",
  "11:15 AM to 11:30 AM",
  "11:30 AM to 11:45 AM",
  "11:45 AM to 12:00 PM",
  "12:00 PM to 12:15 PM",
  "12:15 PM to 12:30 PM",
  "12:30 PM to 12:45 PM",
  "12:45 PM to 1:00 PM",
  "1:00 PM to 1:15 PM",
  "1:15 PM to 1:30 PM",
  "1:30 PM to 1:45 PM",
  "1:45 PM to 2:00 PM",
  "2:00 PM to 2:15 PM",
  "2:15 PM to 2:30 PM",
  "2:30 PM to 2:45 PM",
  "2:45 PM to 3:00 PM"
];

class Slots extends StatefulWidget {
  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          timings.length,
          (index) {
            return FractionallySizedBox(
              widthFactor: 0.3,
              child: Container(
                child: ListTile(
                  leading: Radio(
                    activeColor: Colors.blue,
                    value: index,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as int?;
                      });
                    },
                  ),
                  title: Text(
                    timings[index],
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DoctorDetailsPage extends StatelessWidget {
  final Doctor doctor;

  DoctorDetailsPage(this.doctor);

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
                  Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Available Slots",
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

  Widget build(BuildContext context) {
    return Scaffold(
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
                                child: Image.network(doctor.doctorImage,
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
                                              doctor.doctorName,
                                              style: TextStyle(fontSize: 30),
                                            )
                                          ])),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: [
                                          Container(
                                              child: Row(children: [
                                            Icon(FontAwesomeIcons.userDoctor,
                                                size: 40),
                                            SizedBox(width: 6),
                                            Text(
                                              doctor.specialization,
                                              style: TextStyle(fontSize: 25),
                                            )
                                          ])),
                                        ],
                                      )),
                                      Container(
                                          child: Row(
                                        children: [
                                          Container(
                                              child: Row(children: [
                                            Icon(
                                                Icons
                                                    .cast_for_education_rounded,
                                                size: 40),
                                            SizedBox(width: 6),
                                            Text(
                                              doctor.education,
                                              style: TextStyle(fontSize: 25),
                                            )
                                          ])),
                                        ],
                                      ))
                                    ],
                                  )),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Center(
                                      child: Container(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                RatingBar.builder(
                                                  ignoreGestures: true,
                                                  initialRating: doctor.rating,
                                                  minRating: doctor.rating,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  tapOnlyMode: false,
                                                  onRatingUpdate: (rating) {},
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "${doctor.totalRatings}",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                              child: Row(
                                            children: [
                                              Container(
                                                  child: Row(children: [
                                                SizedBox(
                                                    height: 70,
                                                    width: 70,
                                                    child: Image.asset(
                                                        "experienceIcon.png")),
                                                SizedBox(width: 6),
                                                Text(
                                                  doctor.experience,
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                )
                                              ])),
                                            ],
                                          )),
                                        ],
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Description :",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(doctor.description),
                                    ]),
                              )),
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
                        BlueLine(),
                        Expanded(
                            flex: 3,
                            child: FractionallySizedBox(
                              heightFactor: 0.7,
                              child: Container(child: Slots()),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                                child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PatientPageBookingAppointment();
                            }));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Color(0xFF13235A) ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero, 
                                    ),
                                  ),
                                ),
                                child: Text("Book Appointment",style: TextStyle(color:Colors.white),),
                              ),
                            )))
                      ],
                    )))))
      ],
    ));
  }
}
