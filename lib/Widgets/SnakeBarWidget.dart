import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:get/get.dart';

class SnakeBarWidget {
  dynamic snakeBar(
      String error, String warning, Icon icon, SnackPosition position) {
    return Get.snackbar(
      error,
      warning,
      snackPosition: position,
      icon: icon,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 2),
      borderRadius: 40,
      dismissDirection: DismissDirection.horizontal,
      isDismissible: false,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      backgroundGradient: LinearGradient(
        colors: [
          Color(Utils.secondaryColor),
          Color(Utils.primaryColor),
        ],
      ),
    );
  }
}
