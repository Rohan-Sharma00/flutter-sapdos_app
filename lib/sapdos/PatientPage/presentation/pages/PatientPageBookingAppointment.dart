import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

enum PaymentMethod {
  NetBanking,
  Card,
  UPI,
}

class PatientPageBookingAppointment extends StatefulWidget {
  @override
  _PatientPageBookingAppointment createState() =>
      _PatientPageBookingAppointment();
}

void showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      
      return AlertDialog(
        backgroundColor: Color(0xFF13235A),
        title: Icon(FontAwesomeIcons.diagramSuccessor,color: Colors.white,),
      
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Center(child: Text('Your booking is confirmed',style:TextStyle(color: Colors.white,fontSize: 25))),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: const Text('okay',style: TextStyle(fontSize: 22),),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF13235A)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}

Container cardDetails(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your details below",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Card Number",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 2),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Card Holder",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 2),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "MM/YY",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "CVV",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: () {
                showAlert(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF13235A)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
          ),
        )
      ],
    ),
  );
}

class _PatientPageBookingAppointment
    extends State<PatientPageBookingAppointment> {
  bool isCard = false;

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
              Container(
                  child: FractionallySizedBox(
                widthFactor: 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Booking Appointment",
                          style: Theme.of(context).textTheme.displayMedium),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 45),
                              child: FractionallySizedBox(
                                child: Container(
                                  child: DropdownMenu(
                                      label: Text("Payment Methods"),
                                      menuHeight: 200,
                                      width: 300,
                                      hintText: "Select",
                                      onSelected: (method) {
                                        if (method!.name == "Card") {
                                          setState(() {
                                            isCard = true;
                                          });
                                        } else {
                                          setState(() {
                                            isCard = false;
                                          });
                                        }
                                      },
                                      dropdownMenuEntries: PaymentMethod.values
                                          .map((method) => DropdownMenuEntry(
                                              value: method, label: method.name))
                                          .toList()),
                                ),
                              )),
                          Text("Select mode of payment you prefer"),
                          isCard ? cardDetails(context) : Container(),
                        ],
                      ),
                       SizedBox(height: 20,),
                       
                  
                    ],
                  ),
                ),
              )),
            ]))
      ]),
    ));
  }
}
