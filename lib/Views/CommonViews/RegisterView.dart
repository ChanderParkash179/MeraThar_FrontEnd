import 'package:flutter/material.dart';
import 'package:front_app/Service/RegistrationService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/TextFieldWidget.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _securityQuestionController = TextEditingController();

  final RegistrationService registrationService = RegistrationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                Color(Utils.primaryColor),
                Color(Utils.secondaryColor),
              ])),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonWidgets().verticalSize(5),
                  Image.asset(
                    Utils.splashIcon1,
                    width: 200,
                    height: 200,
                  ),
                  CommonWidgets().verticalSize(20),
                  Icon(
                    Icons.app_registration,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_100,
                  ),
                  CommonWidgets().verticalSize(30),
                  Text(
                    Utils.registerViewSlogan,
                    style: TextStyle(
                        fontSize: Utils.size_18,
                        color: Color(Utils.colorWhite)),
                  ),
                  CommonWidgets().verticalSize(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          controller: _userNameController,
                          hintText: Utils.userNameHintText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(10),
                      TextFieldWidget(
                          controller: _passwordController,
                          hintText: Utils.passwordHintText,
                          obsecureText: true),
                      CommonWidgets().verticalSize(10),
                      TextFieldWidget(
                          controller: _securityQuestionController,
                          hintText: Utils.securityQuestionText,
                          obsecureText: false),
                    ],
                  ),
                  CommonWidgets().verticalSize(20),
                  ButtonWidget(
                    onTap: () {
                      setState(() {
                        registrationService.registrationNavigation(
                          context,
                          _userNameController,
                          _passwordController,
                          _securityQuestionController,
                        );
                      });
                    },
                    title: Utils.register,
                  ),
                  CommonWidgets().verticalSize(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Utils.alreadyRegisterMsg,
                        style: TextStyle(
                          color: Color(Utils.colorWhite),
                          fontSize: Utils.size_18,
                        ),
                      ),
                      CommonWidgets().horizontalSize(10),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/loginView');
                        },
                        child: Text(
                          Utils.login,
                          style: TextStyle(
                            color: Color(Utils.primaryColor),
                            fontSize: Utils.size_18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CommonWidgets().verticalSize(15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
