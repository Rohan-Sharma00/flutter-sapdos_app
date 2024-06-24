
import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';

abstract class LoginRepository {
  Future<Either<bool, bool>> login(LoginCredential credential);
}
