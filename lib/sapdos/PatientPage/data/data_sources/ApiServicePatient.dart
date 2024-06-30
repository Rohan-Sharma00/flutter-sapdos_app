import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServicePatient {
  final String url;
  final String? body;

  ApiServicePatient({required this.url, this.body});

  Future<dynamic> executeApiPost() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: Constants.headers,
        body: body,
      );
      print("response status = ${response.statusCode} \n ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> executeApiGet() async {
    //  print("url = ${this.url} \n body = ${this.body}");
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(
      //     "response status = ${response.statusCode} \n responsebody = ${response.body}");

      if (response.statusCode == 200) {
       
        return response;
      } else {
        return [];
      }
    } catch (e) {
      return false;
    }
  }
}
