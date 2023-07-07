import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/SnakeBarWidget.dart';
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

    final responseData = jsonDecode(response.body);
    final userJson = responseData['responseData']['user'];
    final responseCode = responseData['responseCode'];

    if (responseCode == 'SUCCESS_201') {
      _isAuthenticated = true;
      SnakeBarWidget().snakeBar(
        'REGISTER',
        'User Registered Successfully!',
        FaIcon(
          FontAwesomeIcons.registered,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed("/loginView");
      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else if (responseCode == 'ERROR_404') {
      _isAuthenticated = false;
      SnakeBarWidget().snakeBar(
        'ERROR_404',
        'Registered 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed("/registerUser");
      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else if (responseCode == 'ERROR_400') {
      _isAuthenticated = false;
      SnakeBarWidget().snakeBar(
        'ERROR_404',
        'Registered 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed("/registerUser");
      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else {
      _isAuthenticated = false;
      SnakeBarWidget().snakeBar(
        'else',
        'Registered 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed("/registerUser");
      throw Exception('Failed to login');
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

    if (responseCode == 'SUCCESS_202') {
      _isAuthenticated = true;
      Get.toNamed("/touristView");
      SnakeBarWidget().snakeBar(
        'SUCCESS_202',
        'LOGIN 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else if (responseCode == 'ERROR_404') {
      _isAuthenticated = false;
      SnakeBarWidget().snakeBar(
        'ERROR_404',
        'login 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else {
      SnakeBarWidget().snakeBar(
        'else',
        'login 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed("/registerUser");
      throw Exception('Failed to login');
    }
  }

  void logout() {
    _isAuthenticated = false;
    if (!_isAuthenticated) {
      SnakeBarWidget().snakeBar(
        'logout()',
        'logout 01',
        FaIcon(
          FontAwesomeIcons.algolia,
          color: Color(Utils.colorWhite),
          size: Utils.size_26,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed('/loginView');
    }
  }
}
