import 'dart:convert';

import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:front_app/Utils/ResponseCodes.dart';
import 'package:http/http.dart' as http;

class UserService {
  List genders = ['MALE', 'FEMALE'];

  Future<User> findByEmail(String email) async {
    final response = await http.post(
      Uri.parse(Endpoints.email),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    final jsonResponse = jsonDecode(response.body);
    final responseCode = jsonResponse['responseCode'];
    final responseData = jsonResponse['responseData'];
    final userJson = responseData['user'];

    if (responseCode == ResponseCodes.CODE_USER_FOUND) {
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}
