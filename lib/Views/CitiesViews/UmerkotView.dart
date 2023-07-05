import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Views/AppServicesViews/TravelingView.dart';
import 'package:front_app/Widgets/AppBackground.dart';
import 'package:front_app/Widgets/GridViewButtonWidget.dart';
import 'package:front_app/Widgets/HiddenDrawer.dart';
import 'package:get/get.dart';

class UmerkotView extends StatefulWidget {
  const UmerkotView({Key? key}) : super(key: key);

  @override
  State<UmerkotView> createState() => _UmerkotViewState();
}

class _UmerkotViewState extends State<UmerkotView> {
  @override
  Widget build(BuildContext context) {
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
        body: AppBackground(
          padding: Padding(
            padding: EdgeInsets.fromLTRB(0, Utils.size_32, 0, 0),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.mapLocation,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_32,
                  ),
                ),
                GridViewButtonWidget(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HotelView(cityName: Utils.umerkot),
                        ),
                      );
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.hotel,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_32,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.bowlFood,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_32,
                  ),
                ),
                GridViewButtonWidget(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TravelingView(cityName: Utils.umerkot),
                        ),
                      );
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.car,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_32,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.landmarkDome,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
