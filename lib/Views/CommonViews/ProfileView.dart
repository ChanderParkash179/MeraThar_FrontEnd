import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/AppBackground.dart';
import 'package:front_app/Widgets/BottomNavBarWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/ProfileItemWidget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
          padding: EdgeInsets.all(Utils.size_20),
          child: Column(
            children: [
              CommonWidgets().verticalSize(Utils.size_40),
              CircleAvatar(
                radius: Utils.size_70,
                backgroundImage: AssetImage(Utils.profileImage),
              ),
              CommonWidgets().verticalSize(Utils.size_20),
              ProfileItemWidget.profileItem(
                  Utils.FIRSTNAME, 'Ahad Hashmi', FontAwesomeIcons.user),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.LASTNAME, 'Hashmi', FontAwesomeIcons.user),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.EMAIL, 'test@gmail.com', CupertinoIcons.mail),
              CommonWidgets().verticalSize(Utils.size_10),
              ProfileItemWidget.profileItem(
                  Utils.GENDER, 'FEMALE', FontAwesomeIcons.venusMars),
              CommonWidgets().verticalSize(Utils.size_10),
            ],
          ),
        ),
      ),
    );
  }
}
