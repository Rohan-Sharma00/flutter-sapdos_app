import 'package:flutter_sapdos_app/sapdos/LoginPages/domain/entities/login_credential.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApiService {
  final String baseUrl =
      "https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login";

  Future<bool> login(LoginCredential credential) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userName': credential.email,
          'password': credential.password,
        }),
      );
      print("api is hittin = ${response.body}  =  ${response.statusCode}");

      if (response.statusCode == 200) {
        print("api Login response success ");

        final data = jsonDecode(response.body);
        print("Login response success : $data");
        return true;
      } else {
        print("Login response failed ");

        print("Login failed with status code: ${response.statusCode}");
        print("api Login failed with status code:");

        return false;
      }
    } catch (e) {
      print("Exception during login: $e");
      return false;
    }
  }
}
