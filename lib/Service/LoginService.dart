import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/CommonViews/TouristView.dart';
import 'package:front_app/Widgets/SnakeBarWidget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginService {
  void loginNavigation(BuildContext context, TextEditingController _userName,
      TextEditingController _password) {
    if (_userName.text.isNotEmpty && _password.text.isNotEmpty) {
      Get.to(const TouristView());
    } else {
      SnakeBarWidget().snakeBar(
          Utils.error,
          Utils.loginWarning,
          Icon(
            Icons.warning,
            color: Color(Utils.colorRed),
          ),
          SnackPosition.TOP);
    }
  }
}
