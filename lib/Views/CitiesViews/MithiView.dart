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
                              TouristPointView(cityName: Utils.mithi),
                        ),
                      );
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.mapLocation,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_24,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.hotel,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_24,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.bowlFood,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_24,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.car,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_24,
                  ),
                ),
                GridViewButtonWidget(
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
                  icon: FaIcon(
                    FontAwesomeIcons.landmarkDome,
                    color: Color(Utils.colorWhite),
                    size: Utils.size_24,
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
