import 'package:flutter/material.dart';
import 'package:front_app/Service/AuthenticationService.dart';
import 'package:front_app/Service/UserService.dart';
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
  final AuthenticationService authenticationService = AuthenticationService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final UserService userService = UserService();
  String? _selectedGender;

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
                  CommonWidgets().verticalSize(Utils.size_20),
                  Icon(
                    Icons.app_registration,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_100,
                  ),
                  CommonWidgets().verticalSize(Utils.size_30),
                  Text(
                    Utils.registerViewSlogan,
                    style: TextStyle(
                        fontSize: Utils.size_18,
                        color: Color(Utils.colorWhite)),
                  ),
                  CommonWidgets().verticalSize(Utils.size_20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          controller: _firstNameController,
                          hintText: Utils.firstNameText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(Utils.size_10),
                      TextFieldWidget(
                          controller: _lastNameController,
                          hintText: Utils.lastNameText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(Utils.size_10),
                      TextFieldWidget(
                          controller: _emailController,
                          hintText: Utils.emailHintText,
                          obsecureText: false),
                      CommonWidgets().verticalSize(Utils.size_10),
                      TextFieldWidget(
                          controller: _passwordController,
                          hintText: Utils.passwordHintText,
                          obsecureText: true),
                      CommonWidgets().verticalSize(Utils.size_10),
                      Row(
                        children: [
                          for (String gender in userService.genders)
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text(
                                  gender,
                                  style: TextStyle(
                                    fontSize: Utils.size_12,
                                    color: Color(
                                      Utils.colorWhite,
                                    ),
                                  ),
                                ),
                                selectedTileColor: Color(Utils.primaryColor),
                                activeColor: Color(Utils.primaryColor),
                                tileColor: Color(Utils.primaryColor),
                                value: gender,
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                    print(_selectedGender);
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  CommonWidgets().verticalSize(Utils.size_20),
                  ButtonWidget(
                    onTap: () {
                      setState(() {
                        authenticationService.register(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _passwordController.text,
                            _selectedGender.toString());
                      });
                    },
                    title: Utils.register,
                  ),
                  CommonWidgets().verticalSize(Utils.size_24),
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
                      CommonWidgets().horizontalSize(Utils.size_10),
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
                  CommonWidgets().verticalSize(Utils.size_14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
