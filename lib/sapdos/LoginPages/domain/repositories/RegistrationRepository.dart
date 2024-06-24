import 'package:dartz/dartz.dart';

abstract class RegistrationRepository {
  Future<Either<bool, bool>> registerUser(String email, String password);
}
