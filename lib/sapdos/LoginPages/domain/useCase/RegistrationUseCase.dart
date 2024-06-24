import 'package:dartz/dartz.dart';

import 'package:flutter_sapdos_app/sapdos/LoginPages/data/repositories/RegistrationRepository.dart';

class RegistrationUseCase {
 RegistrationRepository register=new RegistrationRepository();
  Future<Either<bool,bool>> call(String email, String password) async {
    return await register.registerUser(email, password);
  }
}
