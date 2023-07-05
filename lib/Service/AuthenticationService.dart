import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationService {
  bool _isAuthenticated = false;

  void login(BuildContext context, email, var password) {}

  void register(BuildContext context, var email, var password, var firstName,
      var lastName) {}

  void logout() {
    _isAuthenticated = false;
    if (!_isAuthenticated) {
      Get.toNamed('/loginView');
    }
  }
}
