import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Utils/Endpoints.dart';
import 'package:front_app/Utils/ResponseCodes.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/SnakeBarWidget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  bool _isAuthenticated = false;

  // REGISTER - SERVICE
  Future<User> register(String firstName, String lastName, String email,
      String password, String gender) async {
    final url = Uri.parse(Endpoints.register);

    final requestBody = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'gender': gender,
    };

    final response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    final responseData = jsonDecode(response.body);
    final userJson = responseData['responseData']['user'];
    final responseCode = responseData['responseCode'];

    if (responseCode == ResponseCodes.CODE_USER_INPUT_EMPTY) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_PARAMETERS_INVALID,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_PARAMETERS_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_PARAMETERS_UNAVAILABLE,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_EMAIL_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_EMAIL_POLICY,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_PASSWORD_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_PASSWORD_POLICY,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_ALREADY_EXISTS) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_ALREADY_EXIST,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/loginView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_CREATED) {
      _isAuthenticated = true;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_SIGNUP_SUCCESSFULLY,
        FaIcon(
          FontAwesomeIcons.registered,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(Utils.USER_FIRSTNAME, userJson['firstName']);
      sp.setString(Utils.USER_LASTNAME, userJson['lastName']);
      sp.setString(Utils.USER_EMAIL, userJson['email']);
      sp.setString(Utils.USER_GENDER, userJson['gender']);

      Get.toNamed("/loginView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_SIGNUP_FAILED) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.REGISTER,
        ResponseCodes.MSG_USER_SIGNUP_FAILED,
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    } else {
      _isAuthenticated = false;

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

      Get.toNamed("/registerView");

      return User(
        firstName: userJson['firstName'],
        lastName: userJson['lastName'],
        email: userJson['email'],
        password: userJson['password'],
        gender: userJson['gender'],
      );
    }
  }

  // LOGIN - SERVICE
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

    if (responseCode == ResponseCodes.CODE_USER_INPUT_EMPTY) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_PARAMETERS_INVALID,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_PARAMETERS_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_PARAMETERS_UNAVAILABLE,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_EMAIL_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_EMAIL_POLICY,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_PASSWORD_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_PASSWORD_POLICY,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_NOT_FOUND) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_NO_USER_EXIST,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_LOGIN) {
      _isAuthenticated = true;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_LOGIN_SUCCESSFULLY,
        FaIcon(
          FontAwesomeIcons.userPlus,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );

      Get.toNamed("/touristView");

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(Utils.USER_FIRSTNAME, userJson['firstName']);
      sp.setString(Utils.USER_LASTNAME, userJson['lastName']);
      sp.setString(Utils.USER_EMAIL, userJson['email']);
      sp.setString(Utils.USER_GENDER, userJson['gender']);

      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_PASSWORD_INVALID) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_PASSWORD_INCORRECT,
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
        password: userJson['password'],
      );
    } else if (responseCode == ResponseCodes.CODE_USER_LOGIN_FAILED) {
      _isAuthenticated = false;

      SnakeBarWidget().snakeBar(
        Utils.LOGIN,
        ResponseCodes.MSG_USER_LOGIN_FAILED,
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
        password: userJson['password'],
      );
    } else {
      _isAuthenticated = false;

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

      Get.toNamed("/registerView");

      return User(
        email: userJson['email'],
        password: userJson['password'],
      );
    }
  }

  void logout() async {
    _isAuthenticated = false;
    if (!_isAuthenticated) {
      SnakeBarWidget().snakeBar(
        Utils.LOGOUT,
        ResponseCodes.MSG_USER_LOGOUT_SUCCESSFULLY,
        FaIcon(
          FontAwesomeIcons.userSlash,
          color: Color(Utils.colorWhite),
          size: Utils.size_22,
        ),
        SnackPosition.TOP,
      );
      Get.toNamed('/loginView');
    }
  }
}
