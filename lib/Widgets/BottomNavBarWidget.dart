import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * .095,
      color: Color(Utils.primaryColor),
      child: GNav(
        activeColor: Color(Utils.colorWhite),
        backgroundColor: Color(Utils.primaryColor),
        color: Color(Utils.colorWhite),
        selectedIndex: _selectedIndex,
        tabs: [
          GButton(
            active: _selectedIndex == 0 ? true : false,
            icon: CupertinoIcons.home,
            text: Utils.HOME,
            onPressed: () {
              Future.delayed(Duration(seconds: Utils.size_02.toInt()), () {
                Get.toNamed("/touristView");
              });
            },
          ),
          GButton(
            active: _selectedIndex == 1 ? true : false,
            icon: Icons.logout,
            text: Utils.LOGOUT,
            onPressed: () {
              Future.delayed(Duration(seconds: Utils.size_02.toInt()), () {
                Get.toNamed("/loginView");
              });
            },
          ),
          GButton(
            active: _selectedIndex == 2 ? true : false,
            icon: CupertinoIcons.profile_circled,
            text: Utils.PROFILE,
            onPressed: () {
              Future.delayed(Duration(seconds: Utils.size_02.toInt()), () {
                Get.toNamed("/profileView");
              });
            },
          ),
        ],
      ),
    );
  }
}
