import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Views/AppServicesViews/CultureView.dart';
import 'package:front_app/Views/AppServicesViews/HotelView.dart';
import 'package:front_app/Views/AppServicesViews/RestaurantView.dart';
import 'package:front_app/Views/AppServicesViews/TouristPointView.dart';
import 'package:front_app/Views/AppServicesViews/TravelingView.dart';
import 'package:front_app/Views/CommonViews/TouristView.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Utils.size_18,
    color: Color(
      Utils.colorWhite,
    ),
  );
  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.touristView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        TouristView(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.visitingPointView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        TouristPointView(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.hotelView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        HotelView(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.restaurantsView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        RestaurantView(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.travelingView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        TravelingView(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: Utils.cultureView,
            baseStyle: textStyle,
            selectedStyle: textStyle),
        CultureView(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Color(Utils.primaryColor),
      initPositionSelected: 0,
      slidePercent: 40,
      contentCornerRadius: 60,
    );
  }
}
