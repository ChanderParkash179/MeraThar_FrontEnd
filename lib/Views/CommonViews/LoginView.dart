import 'package:flutter/material.dart';
import 'package:front_app/Service/AuthenticationService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/TextFieldWidget.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  CommonWidgets().verticalSize(Utils.size_06),
                  FaIcon(
                    FontAwesomeIcons.unlockKeyhole,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_100,
                  ),
                  CommonWidgets().verticalSize(Utils.size_30),
                  Text(
                    Utils.loginViewSlogan,
                    style: TextStyle(
                        fontSize: Utils.size_18,
                        color: Color(Utils.colorWhite)),
                  ),
                  CommonWidgets().verticalSize(Utils.size_20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          controller: _emailController,
                          hintText: Utils.emailHintText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(Utils.size_10),
                      TextFieldWidget(
                          controller: _passwordController,
                          hintText: Utils.passwordHintText,
                          obsecureText: true)
                    ],
                  ),
                  CommonWidgets().verticalSize(Utils.size_10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: Utils.forgotPassword,
                          titlePadding: EdgeInsets.symmetric(
                              horizontal: Utils.size_10,
                              vertical: Utils.size_10),
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
                  CommonWidgets().verticalSize(Utils.size_10),
                  ButtonWidget(
                    onTap: () async {
                      authenticationService.login(
                        _emailController.text,
                        _passwordController.text,
                      );

                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setBool(Utils.KEY_LOGIN, true);
                      sp.setString(
                          Utils.EMAIL, _emailController.text.toString());
                    },
                    title: Utils.login,
                  ),
                  CommonWidgets().verticalSize(Utils.size_24),
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
                        CommonWidgets().horizontalSize(Utils.size_10),
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
                  CommonWidgets().verticalSize(Utils.size_16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
