
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/data_sources/RegistrationApiProvider.dart';
import 'package:dartz/dartz.dart';


class RegistrationRepository {
  final RegistrationApiProvider _apiProvider = RegistrationApiProvider();

  Future<Either<bool, bool>> registerUser(String email, String password) async {
    try {
      final result=await _apiProvider.registerUser(email, password);
       if(result==true)
       {
      return Right(true);
       }
      else
      {
      return Left(false);
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
