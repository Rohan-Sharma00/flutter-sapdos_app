import 'dart:convert';

import 'package:flutter_sapdos_app/sapdos/PatientPage/data/data_sources/ApiServicePatient.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:intl/intl.dart';

abstract class Repository {
  Future<List<PersonCredentials>> fetchAllPatient();
  Future<List<AvailabilitySlot>> fetchAvailabilitySlot(String id);
}

class RepositoryImpl implements Repository {


  @override
  Future<List<PersonCredentials>> fetchAllPatient() async {
    String url = Constants.baseUrl + Constants.getAllDoctorUrl;
    ApiServicePatient service = new ApiServicePatient(url: url);
    final response = await service.executeApiGet();
    List<PersonCredentials> data = [];
    final result = json.decode(response.body);

    for (int i = 0; i < result.length; i++) {
      PersonCredentials obj =
          PersonCredentials.fromJson(result[i] as Map<String, dynamic>);
      data.add(obj);
    }
   
    return data;
  }
  
  @override
  Future<List<AvailabilitySlot>> fetchAvailabilitySlot(String id) async {
     DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd/MM/yyyy').format(now);
   String urlEncodedDate = Uri.encodeComponent(formattedDate);
    String url = Constants.baseUrl + Constants.getAvailableSlots +"DoctorUId=${id}&Date=${urlEncodedDate}";
    ApiServicePatient service = new ApiServicePatient(url: url);
    final response = await service.executeApiGet();
    List<AvailabilitySlot> data = [];
    final result = json.decode(response.body);

    for (int i = 0; i < result.length; i++) {
      AvailabilitySlot obj =
          AvailabilitySlot.fromJson(result[i] as Map<String, dynamic>);
      data.add(obj);
    }

   
    return data;
  }


}


