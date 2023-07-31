import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Model/UserModel/User.dart';
import 'package:front_app/Service/UserService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/AppBackground.dart';
import 'package:front_app/Widgets/BottomNavBarWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/ProfileItemWidget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserService userService = UserService();
  User? user;
  String? firstName, lastName, userEmail, gender, genderProfile;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString(Utils.USER_EMAIL);
    try {
      final user = await userService.findByEmail(email.toString());
      setState(() {
        this.user = user;
        firstName = user.firstName;
        lastName = user.lastName;
        userEmail = user.email;
        gender = user.gender;

        if (gender == Utils.MALE) {
          genderProfile = Utils.maleGenderImage;
        } else {
          genderProfile = Utils.femaleGenderImage;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarWidget(),
      appBar: AppBar(
        title: Text(
          Utils.PROFILE,
          style: TextStyle(
              letterSpacing: 1.2,
              fontSize: Utils.size_18,
              fontWeight: FontWeight.bold,
              color: Color(Utils.colorWhite)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(Utils.primaryColor),
      ),
      body: AppBackground(
        padding: Padding(
          padding: EdgeInsets.symmetric(horizontal: Utils.size_06),
          child: Column(
            children: [
              CommonWidgets().verticalSize(Utils.size_40),
              CircleAvatar(
                radius: Utils.size_70,
                backgroundImage: AssetImage(genderProfile.toString()),
              ),
              CommonWidgets().verticalSize(Utils.size_20),
              ProfileItemWidget.profileItem(
                  Utils.FIRSTNAME, firstName.toString(), FontAwesomeIcons.user),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.LASTNAME, lastName.toString(), FontAwesomeIcons.user),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.EMAIL, userEmail.toString(), CupertinoIcons.mail),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.GENDER,
                  gender.toString(),
                  gender.toString() == Utils.MALE
                      ? FontAwesomeIcons.mars
                      : FontAwesomeIcons.venus),
              CommonWidgets().verticalSize(Utils.size_10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Future.delayed(Duration(seconds: Utils.size_02.toInt()),
                        () {
                      userService.deleteUser(userEmail!);
                      Get.toNamed("/loginView");
                    });
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.size_04),
                    color: Color(Utils.colorWhite),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Utils.size_12),
                    child: Text(
                      Utils.deleteUserAccountMsg,
                      style: TextStyle(
                        color: Color(Utils.colorRed),
                        fontSize: Utils.size_14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
