import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Views/AppServicesViews/TravelingView.dart';
import 'package:front_app/Widgets/ButtonWidget.dart';
import 'package:get/get.dart';

class UmerkotView extends StatefulWidget {
  const UmerkotView({Key? key}) : super(key: key);

  @override
  State<UmerkotView> createState() => _UmerkotViewState();
}

class _UmerkotViewState extends State<UmerkotView> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.umerkot.toUpperCase(),
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
                                  TouristPointView(cityName: Utils.umerkot),
                            ),
                          );
                        });
                      },
                      height: Utils.size_24,
                      width: Utils.size_24,
                      icon: Icon(
                        size: Utils.size_24,
                        Icons.place_outlined,
                        color: Color(Utils.colorWhite),
                      ),
                      // title: Utils.visitingPoint.toUpperCase(),
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
                      height: Utils.size_24,
                      width: Utils.size_24,
                      icon: Icon(
                        size: Utils.size_24,
                        color: Color(Utils.colorWhite),
                        Icons.hotel_outlined,
                      ),
                      // title: Utils.hotels.toUpperCase(),
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
                                  RestaurantView(cityName: Utils.umerkot),
                            ),
                          );
                        });
                      },
                      height: Utils.size_24,
                      width: Utils.size_24,
                      icon: Icon(
                        size: Utils.size_24,
                        color: Color(Utils.colorWhite),
                        Icons.food_bank_outlined,
                      ),
                      // title: Utils.restaurant.toUpperCase(),
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
                      height: Utils.size_24,
                      width: Utils.size_24,
                      icon: Icon(
                          size: Utils.size_24,
                          color: Color(Utils.colorWhite),
                          Icons.car_repair_outlined),
                      // title: Utils.traveling.toUpperCase(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Utils.size_08),
                    child: ButtonWidget(
                      onTap: () {
                        setState(() {
                          Get.to(
                            CultureView(
                              Utils.umerkot,
                              Utils.umerkot_icon_img,
                              Utils.umerkotCulture,
                              Utils.umerkotWeb,
                            ),
                          );
                        });
                      },
                      height: Utils.size_24,
                      width: Utils.size_24,
                      icon: Icon(
                          size: Utils.size_24,
                          color: Color(Utils.colorWhite),
                          Icons.history_edu_outlined),
                      // title: Utils.culture.toUpperCase(),
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
