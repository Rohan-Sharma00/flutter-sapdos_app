import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String url;
  final String? body;

  ApiService({required this.url,  this.body});

  Future<dynamic> executeApiPost() async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: Constants.headers, body: body);
      print("response status = ${response.statusCode} \n ${response.body}");

      if (response.statusCode == 200) {
        return response;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

 
}
