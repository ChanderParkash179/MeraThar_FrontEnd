import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:get/get.dart';

class SnakeBarWidget {
  dynamic snakeBar(
      String? error, String? warning, FaIcon? icon, SnackPosition? position) {
    return Get.snackbar(
      error.toString(),
      warning.toString(),
      snackPosition: position,
      icon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.size_12,
          vertical: Utils.size_12,
        ),
        child: icon,
      ),
      duration: Duration(seconds: Utils.size_04.toInt()),
      animationDuration: Duration(seconds: Utils.size_02.toInt()),
      borderRadius: Utils.size_20,
      dismissDirection: DismissDirection.horizontal,
      isDismissible: false,
      margin: EdgeInsets.symmetric(
        horizontal: Utils.size_10,
        vertical: Utils.size_20,
      ),
      backgroundGradient: LinearGradient(
        colors: [
          Color(Utils.primaryColor).withOpacity(0.75),
          Color(Utils.secondaryColor).withOpacity(0.75),
        ],
      ),
    );
  }
}
