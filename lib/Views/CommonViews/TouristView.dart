import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/CommonViews/LoginView.dart';
import 'package:front_app/Widgets/AppBackground.dart';
import 'package:front_app/Widgets/BottomNavBarWidget.dart';
import 'package:front_app/Widgets/ButtonImageWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/DrawerWidget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TouristView extends StatefulWidget {
  const TouristView({Key? key}) : super(key: key);

  @override
  State<TouristView> createState() => _TouristViewState();
}

class _TouristViewState extends State<TouristView> {
  String? userEmail;
  bool? isLoggedIn;

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var email = sp.getString(Utils.EMAIL).toString();

    setState(() {
      userEmail = email;
    });
  }

  @override
  void initState() {
    super.initState;
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBarWidget(),
        drawer: DrawerWidget(email: userEmail.toString()),
        appBar: AppBar(
          title: Text(
            Utils.citiesPage.toUpperCase(),
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
            padding: EdgeInsets.all(Utils.size_10),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonImageWidget(
                      onTap: () {
                        setState(() {
                          Get.toNamed('/umerkotView');
                        });
                      },
                      imagePath: Utils.umerkot_icon_img,
                      title: Utils.umerkot.toUpperCase(),
                    ),
                    CommonWidgets().verticalSize(Utils.size_12),
                    ButtonImageWidget(
                      onTap: () {
                        setState(() {
                          Get.toNamed('/mithiView');
                        });
                      },
                      imagePath: Utils.mithi_icon_img,
                      title: Utils.mithi.toUpperCase(),
                    ),
                    CommonWidgets().verticalSize(Utils.size_12),
                    ButtonImageWidget(
                      onTap: () {
                        setState(() {
                          Get.toNamed('/nagarparkarView');
                        });
                      },
                      imagePath: Utils.nagarparkar_icon_img,
                      title: Utils.nagarparkar.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
