import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/BottomNavBarWidget.dart';

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
      body: Container(
        child: Center(
          child: Text(Utils.PROFILE),
        ),
      ),
    );
  }
}
