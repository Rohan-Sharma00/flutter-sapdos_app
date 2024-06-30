import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/entities/AvailabilitySlot.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/domain/repositories/Repository.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class UseCaseDoctor {
  RepositoryImpl obj = new RepositoryImpl();

  Future<List<PersonCredentials>> fetchAllPatients() async {
    List<PersonCredentials> list = await obj.fetchAllDoctors();

    return list;
  }

  Future<List<AvailabilitySlot>> CallAvailabilitySlot(String id) async {
    List<AvailabilitySlot> list = await obj.fetchAvailabilitySlot(id);

    return list;
  }
}
