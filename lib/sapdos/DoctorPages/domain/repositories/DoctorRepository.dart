import 'dart:convert';

import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/data/data_sources/ApiServicePatient.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';

import 'package:intl/intl.dart';

abstract class DoctorRepository {
  Future<AllAppointmentEntity> fetchAllPatients(String id);
}

class DoctorRepositoryImpl implements DoctorRepository {

//Doctor/GetDoctorDashbord?DoctorUId=d6eced31-42fd-4061-8a06-40aa794ee8bb&Date=01%2F07%2F2024
  @override
  Future<AllAppointmentEntity> fetchAllPatients(String id) async
   {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String url = Constants.baseUrl + Constants.getDoctorDashboard+id+"&Date=${formattedDate}";
    ApiServicePatient service = new ApiServicePatient(url: url);
    final response = await service.executeApiGet();
    final result = json.decode(response.body);
    print("in doctor home fetching patient data in repo = ${result.toString()}");

   AllAppointmentEntity appointment = AllAppointmentEntity.fromJson(result as Map<String,dynamic>);
   print("appointment = ${appointment.toString()}");
    return appointment;
  }
  


}


