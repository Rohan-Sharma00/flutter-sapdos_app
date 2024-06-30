import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/repositories/loginRepository.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository=new loginRepository();

  Future<Either<bool, LoginCredentials>> call(PersonCredentials credential) {
    return repository.login(credential);
  }
}
