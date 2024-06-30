import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';

import '../data_sources/ApiService.dart';

class RegistrationRepository {
  String createBody(PersonCredentials credential) {
    Map<String, dynamic> data = {"active": true, "dType": "string"};

    if (credential.name != null) {
      data["name"] = credential.name;
    }

    if (credential.mobileNumber != null) {
      data["mobileNumber"] = credential.mobileNumber.toString();
    }
    if (credential.address != null) {
      data["address"] = credential.address;
    }
    if (credential.age != null) {
      data["age"] = credential.age.toString();
    }
    if (credential.specialization != null) {
      data["specialization"] = credential.specialization;
    }
    if (credential.role != null) {
      data["role"] = credential.role;
    }
    if (credential.description != null) {
      data["description"] = credential.description;
    }
    if (credential.experience != null) {
      data["experience"] = credential.experience;
    }
    if (credential.disease != null) {
      data["disease"] = credential.disease;
    }
    data["email"] = credential.email;
    data["password"] = credential.password;

    return jsonEncode(data);
  }

  Future<Either<bool, bool>> registerUser(PersonCredentials obj) async {
    try {
      String url = Constants.baseUrl + Constants.registerUrl;
      String body = createBody(obj);
      final ApiService apiService = new ApiService(url: url, body: body);
      final result = await apiService.executeApiPost();
      print("result in repository = ${result.body.runtimeType}");
      if (result is bool) {
        return Left(false);
      } else {
        return Right(true);
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
