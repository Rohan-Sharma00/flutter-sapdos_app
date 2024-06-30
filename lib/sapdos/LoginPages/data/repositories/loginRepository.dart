import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/data/data_sources/ApiService.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/repositories/login_repository.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';

class loginRepository implements LoginRepository {
  @override
  Future<Either<bool, LoginCredentials>> login(
      PersonCredentials credential) async {
    try {
      String body = jsonEncode({
        Constants.userName: credential.email,
        Constants.password: credential.password,
      });
      String url = Constants.baseUrl + Constants.loginUrl;
      final ApiService obj = new ApiService(url: url, body: body);
      final result = await obj.executeApiPost();
      print("login response in repo login= ${result.body} =");
      if (result is bool) {
        print("login response in repo login type = ${result.runtimeType}");
        return Left(false);
      }
     LoginCredentials details=new LoginCredentials();

      final data = json.decode(result.body);
      if (data != null && data is Map<String, dynamic>) {
        details=LoginCredentials.fromJson(data);
      }
      print("details = ${details.toString()}");
      if ( details.id != null && details.id != "") {
        return Right(details);
      } else {
        return Left(false);
      }
    } catch (e) {
      return Left(false);
    }
  }
}
