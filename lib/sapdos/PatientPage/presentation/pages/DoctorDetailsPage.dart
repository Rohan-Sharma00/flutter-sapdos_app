import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageStates.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientPageBookingAppointment.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';



class Slots extends StatefulWidget {
   final List<AvailabilitySlot> slots;

  Slots({required this.slots});
  
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
          widget.slots.length,
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
                    widget.slots[index].time,
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
  final PersonCredentials doctor;

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
    return BlocProvider(
      create: (context) => DoctorDetailsPageBloc()..add(DoctorDetailsPageSlotsEvent(doctor.id ?? "null")),
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
                                                doctor.name ?? "doctor name",
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
                                                doctor.specialization ??
                                                    "unknown",
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
                                                doctor.specialization ??
                                                    "unknown",
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
                                                    initialRating: 2,
                                                    minRating: 2,
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
                                                    "${2}",
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
                                                    doctor.experience
                                                        .toString(),
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
                                alignment: Alignment.topLeft,
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
                                        Text(doctor.description ?? "unknown"),
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
                          BlueLine(),
                          Expanded(
                              flex: 3,
                              child: FractionallySizedBox(
                                heightFactor: 0.7,
                                // child: Container(child: Slots()),
                                child:BlocBuilder<DoctorDetailsPageBloc,
                                        DoctorDetailsPageStates>(
                                    builder: (context, state) {
                                  if (state is LoadingState) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state is ErrorState) {
                                    return Center(
                                        child: Text(
                                      state.message,
                                      style: TextStyle(
                                        color: state.textColor,
                                        fontSize: 20,
                                      ),
                                    ));
                                  } else if (state
                                      is DoctorDetailsPageSlotsState) {
                                    return Container(
                                        child: SingleChildScrollView(child: Slots(slots:state.credentials))
                                        );
                                  } else {
                                    return Center(
                                        child: Text('Loading Data ..',style: TextStyle(color: Colors.yellow),));
                                  }
                                })
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.go('/payment');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFF13235A)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Book Appointment",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )))
                        ],
                      )))))
        ],
      )),
    );
  }
}
