import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:get/get.dart';

class MithiView extends StatefulWidget {
  const MithiView({Key? key}) : super(key: key);

  @override
  State<MithiView> createState() => _MithiViewState();
}

class _MithiViewState extends State<MithiView> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.mithi.toUpperCase(),
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
                ],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Utils.splashIcon1,
                          width: _width * .80,
                          height: _height * .30,
                        ),
                        CommonWidgets().verticalSize(Utils.size_22),
                        ButtonWidget(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TouristPointView(cityName: Utils.mithi),
                                ),
                              );
                            });
                          },
                          title: Utils.visitingPoint.toUpperCase(),
                        ),
                        CommonWidgets().verticalSize(Utils.size_12),
                        ButtonWidget(
                          onTap: () {
                            setState(() {
                              Get.toNamed('/hotelView');
                            });
                          },
                          title: Utils.hotels.toUpperCase(),
                        ),
                        CommonWidgets().verticalSize(Utils.size_12),
                        ButtonWidget(
                          onTap: () {
                            setState(() {
                              Get.toNamed('/restaurantView');
                            });
                          },
                          title: Utils.restaurant.toUpperCase(),
                        ),
                        CommonWidgets().verticalSize(Utils.size_12),
                        ButtonWidget(
                          onTap: () {
                            setState(() {
                              Get.toNamed('/travelingView');
                            });
                          },
                          title: Utils.traveling.toUpperCase(),
                        ),
                        CommonWidgets().verticalSize(Utils.size_12),
                        ButtonWidget(
                          onTap: () {
                            setState(() {
                              Get.to(CultureView(
                                  Utils.mithi,
                                  Utils.mithi_icon_img,
                                  Utils.mithiCulture,
                                  Utils.mitihiWeb));
                            });
                          },
                          title: Utils.culture.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
