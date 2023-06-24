import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Views/AppServicesViews/TravelingView.dart';
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, Utils.size_32, 0, 0),
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
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
                      icon: Icon(
                        Icons.place_outlined,
                        color: Color(Utils.colorWhite),
                      ),
                      title: Utils.visitingPoint.toUpperCase(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
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
                      icon: Icon(
                        color: Color(Utils.colorWhite),
                        Icons.hotel_outlined,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantView(cityName: Utils.mithi),
                            ),
                          );
                        });
                      },
                      icon: Icon(
                        color: Color(Utils.colorWhite),
                        Icons.food_bank_outlined,
                      ),
                      title: Utils.restaurant.toUpperCase(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TravelingView(cityName: Utils.mithi),
                            ),
                          );
                        });
                      },
                      icon: Icon(
                          color: Color(Utils.colorWhite),
                          Icons.car_repair_outlined),
                      title: Utils.traveling.toUpperCase(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
                      onTap: () {
                        setState(() {
                          Get.to(
                            CultureView(
                              Utils.mithi,
                              Utils.mithi_icon_img,
                              Utils.mithiCulture,
                              Utils.mithiWeb,
                            ),
                          );
                        });
                      },
                      icon: Icon(
                          color: Color(Utils.colorWhite),
                          Icons.history_edu_outlined),
                      title: Utils.culture.toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
