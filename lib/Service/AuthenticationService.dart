import 'dart:convert';

import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  bool _isAuthenticated = false;

  Future<User> register(
      String firstName, String lastName, String email, String password) async {
    final url = Uri.parse(Endpoints.register);

    final requestBody = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };

    final response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final userJson = responseData['responseData']['user'];
      _isAuthenticated = true;
      Get.toNamed("/touristView");

      return User(
        id: userJson['id'],
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
      );
    } else {
      Get.toNamed("/registerUser");
      throw Exception('Failed to register user');
    }
  }

  Future<User> login(String email, String password) async {
    final url = Uri.parse(Endpoints.login);

    final requestBody = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    final responseData = jsonDecode(response.body);
    final userJson = responseData['responseData']['user'];
    final responseCode = responseData['responseCode'];

    if (responseCode == 'SUCCESS_302') {
      _isAuthenticated = true;

      Get.toNamed("/touristView");

      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else if (responseCode == 'ERROR_404') {
      _isAuthenticated = false;

      Get.toNamed("/loginView");

      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else {
      Get.toNamed("/registerUser");
      throw Exception('Failed to login');
    }
  }

  void logout() {
    _isAuthenticated = false;
    if (!_isAuthenticated) {
      Get.toNamed('/loginView');
    }
  }
}
