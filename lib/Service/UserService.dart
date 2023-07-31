import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:front_app/Utils/ResponseCodes.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/SnakeBarWidget.dart';
import 'package:get/get.dart';
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

  Future<User> deleteUser(String email) async {
    final url = Uri.parse(Endpoints.delete);

    final requestBody = {'email': email};

    final response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    final responseData = jsonDecode(response.body);
    final userJson = responseData['responseData']['user'];
    final responseCode = responseData['responseCode'];

    if (responseCode == ResponseCodes.CODE_USER_DELETED) {
      SnakeBarWidget().snakeBar(
        Utils.DELETED,
        ResponseCodes.MSG_USER_DELETED_SUCCESSFULLY,
        FaIcon(
          FontAwesomeIcons.userMinus,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/loginView");

      return User(
        email: userJson['email'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_DELETED_FAILED) {
      SnakeBarWidget().snakeBar(
        Utils.PROFILE,
        ResponseCodes.MSG_USER_DELETED_FAILED,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/profileView");

      return User(
        email: userJson['email'],
      );
    } else {
      SnakeBarWidget().snakeBar(
        Utils.SOMETHING_WENT_WRONG,
        ResponseCodes.MSG_SOMETHING_WENT_WRONG,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/loginView");

      return User(
        email: userJson['email'],
      );
    }
  }
}
