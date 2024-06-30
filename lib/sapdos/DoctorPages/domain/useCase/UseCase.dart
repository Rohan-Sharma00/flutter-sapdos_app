import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/entities/AllAppointmentEntity.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/domain/repositories/DoctorRepository.dart';

import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class UseCaseDoctor {
  DoctorRepositoryImpl obj = new DoctorRepositoryImpl();

  Future<AllAppointmentEntity> fetchAllPatients(LoginCredentials data) async {
    AllAppointmentEntity appointment = await obj.fetchAllPatients(data.id ?? "");

    return appointment;
  }

  
}
