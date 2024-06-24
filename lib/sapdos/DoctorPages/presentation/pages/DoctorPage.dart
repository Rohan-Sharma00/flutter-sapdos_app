import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sapdos_app/sapdos/utils/SapdosSideBar.dart';




class DoctorPage extends StatelessWidget {
  var patientData = [
    {
      "color": "red",
      "timing": "10:00 AM",
      "patient_name": "Alice Johnson",
      "age": "30 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "green",
      "timing": "10:15 AM",
      "patient_name": "David Smith",
      "age": "28 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "blue",
      "timing": "10:30 AM",
      "patient_name": "Emily Brown",
      "age": "35 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "red",
      "timing": "10:45 AM",
      "patient_name": "Michael Davis",
      "age": "32 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "green",
      "timing": "11:00 AM",
      "patient_name": "Sarah Wilson",
      "age": "27 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "blue",
      "timing": "11:15 AM",
      "patient_name": "Kevin Martinez",
      "age": "29 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "red",
      "timing": "11:30 AM",
      "patient_name": "Jessica Taylor",
      "age": "31 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "green",
      "timing": "11:45 AM",
      "patient_name": "Ryan Thompson",
      "age": "33 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "blue",
      "timing": "12:00 PM",
      "patient_name": "Lauren Garcia",
      "age": "26 years",
      "icon": "Icons.timer, color: Colors.green"
    },
    {
      "color": "red",
      "timing": "12:15 PM",
      "patient_name": "Patrick Clark",
      "age": "34 years",
      "icon": "Icons.timer, color: Colors.green"
    }
  ];

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
                            text: '19',
                            style: TextStyle(
                                color: Color(0xFF13235A), fontSize: 20)),
                        TextSpan(
                            text: '/40',
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
                              text: '21',
                              style: TextStyle(
                                  color: Color(0xFF13235A), fontSize: 20)),
                          TextSpan(
                              text: '/40',
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
                "Dr. Amol ",
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

  Container appointments() {
    return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
          itemCount: patientData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.timer,
                      color: _parseColor(patientData[index]["color"] ?? ""),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(patientData[index]["timing"] ?? "",
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
                                        color: _parseColor(patientData[index]["color"] ?? ""), width: 1.5),
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
                                          "Patient Name : ${patientData[index]["patient_name"] ?? ""}",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Text(patientData[index]["age"] ?? "",
                                        style: TextStyle(fontSize: 17)),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child:
                                          patientData[index]["color"] == "blue"
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
            );
          },
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                        FractionallySizedBox(widthFactor: 0.85, child: Boxes()),
                        SizedBox(height: 20),
                        FractionallySizedBox(
                            widthFactor: 0.85, child: BlueLine()),
                        SizedBox(height: 15),
                        Expanded(
                          child: FractionallySizedBox(
                              widthFactor: 0.85, child: appointments()),
                        ),
                      ]))))
            ])));
  }
}
