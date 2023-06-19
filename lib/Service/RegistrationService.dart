import 'package:front_app/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistrationService {
  void registrationNavigation(
      BuildContext context,
      TextEditingController _userName,
      TextEditingController _password,
      TextEditingController _securityQuestion) {
    if (_userName.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _securityQuestion.text.isNotEmpty) {
      Get.toNamed('/touristView');
    } else {
      Get.snackbar(
        Utils.error,
        Utils.registerWarning,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
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
}
