import 'package:dartz/dartz.dart';

import 'package:flutter_sapdos_app/sapdos/LoginPages/data/repositories/RegistrationRepository.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class RegistrationUseCase {
 RegistrationRepository register=new RegistrationRepository();
  Future<Either<bool,bool>> call(PersonCredentials obj) async {
    return await register.registerUser(obj);
  }
}
