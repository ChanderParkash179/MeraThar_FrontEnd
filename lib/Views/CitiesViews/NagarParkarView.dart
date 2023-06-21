import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:get/get.dart';

class NagarParkarView extends StatefulWidget {
  const NagarParkarView({Key? key}) : super(key: key);

  @override
  State<NagarParkarView> createState() => _NagarParkarViewState();
}

class _NagarParkarViewState extends State<NagarParkarView> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.nagarparkar.toUpperCase(),
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
                                  builder: (context) => TouristPointView(
                                      cityName: Utils.nagarparkar),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HotelView(cityName: Utils.mithi),
                                ),
                              );
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
                                  Utils.nagarparkar,
                                  Utils.nagarparkar_icon_img,
                                  Utils.nagarparkarCulture,
                                  Utils.nagarparkarWeb));
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
