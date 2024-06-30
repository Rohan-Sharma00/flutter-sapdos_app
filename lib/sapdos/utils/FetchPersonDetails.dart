 import 'dart:convert';

import 'package:flutter_sapdos_app/sapdos/PatientPage/data/data_sources/ApiServicePatient.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

Future<PersonCredentials> FetchPersonDetails(LoginCredentials credentials) async {
   print("in fetch person");
  String url="";
  if(credentials.role=="patient")
  {
     url = Constants.baseUrl + Constants.getPatientByID+"${credentials.id}";
  }
  else
  {
     url = Constants.baseUrl + Constants.getDoctorByID+"${credentials.id}";

  }
  print("person url = ${url}");
    ApiServicePatient service = new ApiServicePatient(url: url);
    final response = await service.executeApiGet();
    print("person api response = ${response}");
    final result = json.decode(response.body);
    PersonCredentials personDetails=PersonCredentials.fromJson(result);
    print("person details = ${personDetails.toString()}");
    return personDetails;
  }