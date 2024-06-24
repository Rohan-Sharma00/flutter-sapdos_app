import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/data/models/DoctorDataModel.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/DoctorDetailsPage.dart';
import 'package:flutter_sapdos_app/sapdos/utils/SapdosSideBar.dart';

class PatientHomePage extends StatelessWidget {
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
                "Satish",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50),
              ),
            ],
          ),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
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
                    "Doctor's List",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffDCE0ED),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.filter_list,
                    size: 20, color: const Color(0xff13235A)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DataModel> _loadJsonData() async {
    var json = await rootBundle.loadString('json/doctors_list.json');
    var decodedData = jsonDecode(json);
    return DataModel.fromJson(decodedData);
  }

  Widget futureBuild(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<DataModel>(
          future: _loadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            } else {
              DataModel data = snapshot.data!;
              return DoctorDetails(context,data.doctorsList);
            }
          },
        ),
      ),
    );
  }

  InkWell DoctorBox(BuildContext context,var doctor) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorDetailsPage( doctor);
        }));
      },
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Padding(
              padding: EdgeInsets.all(1),
              child: Row(children: [
                Container(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(doctor.doctorImage),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doctor's Name : ${doctor.doctorName}",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(doctor.specialization),
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: doctor.rating,
                        minRating: doctor.rating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                         tapOnlyMode: false,
                        onRatingUpdate: (rating) {
                        },
                      ),
                    ],
                  ),
                )
              ]))),
    );
  }

  Container DoctorDetails(BuildContext context,List<Doctor> data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(data.length, (index) {
          return FractionallySizedBox(
            widthFactor: 0.45,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffDCE0ED),
              ),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DoctorBox(context,data[index]),
              ),
            ),
          );
        }).expand((widget) => [widget, SizedBox(width: 8)]).toList(),
      ),
    );
  }

  void getDataFromJson() {
    FutureBuilder<DataModel>(
      future: _loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        } else {
          DataModel data = snapshot.data!;
          // return Container(color:Colors.amber,child: Text(data.doctorsList[0].specialization));
          return DoctorDetails(context,data.doctorsList);
        }
      },
    );
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
                        SizedBox(height: 20),
                        FractionallySizedBox(
                            widthFactor: 0.85, child: BlueLine()),
                        SizedBox(height: 15),
                        Expanded(
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            child: futureBuild(context),
                          ),
                        ),
                      ]))))
            ])));
  }
}
