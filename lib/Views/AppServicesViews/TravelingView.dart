import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class TravelingView extends StatelessWidget {
  const TravelingView({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Card(
                elevation: 9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Utils.size_16),
                ),
                shadowColor: Color(Utils.secondaryColor),
                margin: EdgeInsets.all(Utils.size_24),
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
    );
  }
}
