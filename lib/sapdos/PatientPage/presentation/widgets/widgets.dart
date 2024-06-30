import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/DoctorDetailsPage.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';

import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:go_router/go_router.dart';

InkWell DoctorBox(BuildContext context, PersonCredentials doctor) {
  return InkWell(
    onTap: () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return DoctorDetailsPage(doctor);
      // }));
      context.go(
        '/doctor/${doctor.id}',
        extra: doctor,
      );
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
                  backgroundImage: NetworkImage(Constants.doctorImageUrl),
                ),
              ),
              SizedBox(width: 10),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Doctor's Name : ${doctor?.name ?? "John"}",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(doctor.specialization ?? "Doctor"),
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 2,
                      minRating: 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      tapOnlyMode: false,
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              )
            ]))),
  );
}

Container DoctorDetails(BuildContext context, List<PersonCredentials> data) {
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
              child: DoctorBox(context, data[index]),
            ),
          ),
        );
      }).expand((widget) => [widget, SizedBox(width: 8)]).toList(),
    ),
  );
}
