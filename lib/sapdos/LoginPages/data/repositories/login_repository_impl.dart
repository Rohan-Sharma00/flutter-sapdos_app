
import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/data_sources/LoginApiService.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService apiService=new LoginApiService();

  @override
  Future<Either<bool, bool>> login(LoginCredential credential) async {
        print("in impl");

    try {
      final result = await apiService.login(credential);
      if(result==true)
      return Right(true);
      else
      return Left(false);

    } catch (e) {
      return Left(false);
    }
  }
}
