import 'package:flutter/material.dart';
import 'package:front_app/Service/AuthenticationService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/TextFieldWidget.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthenticationService authenticationService = AuthenticationService();

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
                  FaIcon(
                    FontAwesomeIcons.unlockKeyhole,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_100,
                  ),
                  CommonWidgets().verticalSize(30),
                  Text(
                    Utils.loginViewSlogan,
                    style: TextStyle(
                        fontSize: Utils.size_18,
                        color: Color(Utils.colorWhite)),
                  ),
                  CommonWidgets().verticalSize(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          controller: _emailController,
                          hintText: Utils.emailHintText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(10),
                      TextFieldWidget(
                          controller: _passwordController,
                          hintText: Utils.passwordHintText,
                          obsecureText: true)
                    ],
                  ),
                  CommonWidgets().verticalSize(10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: Utils.forgotPassword,
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          backgroundColor: Color(Utils.primaryColor),
                          middleTextStyle: TextStyle(fontSize: Utils.size_16),
                          middleText: 'I am dialogGetx');
                    },
                    child: Text(
                      Utils.forgotPassword,
                      style: TextStyle(
                        color: Color(Utils.primaryColor),
                        fontSize: Utils.size_18,
                      ),
                    ),
                  ),
                  CommonWidgets().verticalSize(10),
                  ButtonWidget(
                    onTap: () {
                      authenticationService.login(
                        context,
                        _emailController,
                        _passwordController,
                      );
                    },
                    title: Utils.login,
                  ),
                  CommonWidgets().verticalSize(25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Utils.notRegisterMsg,
                          style: TextStyle(
                            color: Color(Utils.colorWhite),
                            fontSize: Utils.size_18,
                          ),
                        ),
                        CommonWidgets().horizontalSize(10),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/registerView');
                          },
                          child: Text(
                            Utils.register,
                            style: TextStyle(
                              color: Color(Utils.primaryColor),
                              fontSize: Utils.size_18,
                            ),
                          ),
                        ),
                      ],
                    ),
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
