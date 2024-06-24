import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/repositories/login_repository_impl.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository=new LoginRepositoryImpl();

  Future<Either<bool, bool>> call(LoginCredential credential) {
    return repository.login(credential);
  }
}
