
import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

abstract class LoginRepository {
  Future<Either<bool, LoginCredentials>> login(PersonCredentials credential);
}
