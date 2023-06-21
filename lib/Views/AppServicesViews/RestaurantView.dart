import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class RestaurantView extends StatefulWidget {
  final String? cityName;

  RestaurantView({this.cityName});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                Utils.restaurant.toUpperCase(),
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
                    child: SingleChildScrollView()))));
  }
}
