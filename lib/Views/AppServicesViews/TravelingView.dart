import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/GlassBox.dart';

class TravelingView extends StatefulWidget {
  final String? cityName;

  TravelingView({this.cityName});

  @override
  State<TravelingView> createState() => _TravelingViewState();
}

class _TravelingViewState extends State<TravelingView> {
  @override
  Widget build(BuildContext context) {
    final Padding? padding;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.traveling.toUpperCase(),
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
            child: SingleChildScrollView(
              child: GlassBox(
                padding: Padding(
                  padding: EdgeInsets.all(Utils.size_08),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Utils.size_16),
                      gradient: RadialGradient(
                        focalRadius: 4,
                        colors: [
                          Color(Utils.colorRed),
                          Color(Utils.colorOrange),
                        ],
                      ),
                    ),
                    child: Container(),
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
