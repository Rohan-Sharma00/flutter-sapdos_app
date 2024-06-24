import 'package:http/http.dart' as http;
import 'dart:convert';


class RegistrationApiProvider {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register';


String createRegistrationJson(String email, String password) {
  Map<String, dynamic> data = {
    "id": "string",
    "uId": "string",
    "createdOn": "2024-06-19T21:37:36.688Z",
    "updatedOn": "2024-06-19T21:37:36.688Z",
    "createdBy": "string",
    "updatedBy": "string",
    "archived": true,
    "version": 0, 
    "active": true,
    "dType": "string",
    "name": email,
    "email": email,
    "mobileNumber": "",
    "address": "string",
    "age": "string",
    "specialization": "string",
    "role": "patient",
    "description": "string",
    "experience": 0, 
    "password": password,
    "disease": "string"
  };

  return jsonEncode(data);
}


  Future<bool> registerUser(String email, String password) async {
    print("email = ${email} || ${password}");
    try{
       final headers = {
        'Content-Type': 'application/json',
        'Host': 'sapdos-api-v2.azurewebsites.net', 
      };
      final body = createRegistrationJson(email, password);
      final contentLength = utf8.encode(body).length.toString();

      headers['Content-Length'] = contentLength;
    final url = Uri.parse('$baseUrl');
    print("posting api");
    final response = await http.post(
      url,
      headers: headers,
      body: body
    );
  print(" registration api is hittin = ${response.body}  =  ${response.statusCode}");
        print("api registration checking ");

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
  }
     catch (e) {
      print("Exception during registration: $e");
      return false;
    }
  }
}