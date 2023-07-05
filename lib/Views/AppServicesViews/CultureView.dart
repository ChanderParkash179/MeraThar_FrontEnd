import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/AppBackground.dart';
import 'package:front_app/Widgets/GlassBox.dart';
import 'package:url_launcher/url_launcher.dart';

class CultureView extends StatelessWidget {
  final String? cityName;
  final String? cityImg;
  final String? cityCulture;
  final String? cultureWeb;

  const CultureView(
      [this.cityName, this.cityImg, this.cityCulture, this.cultureWeb]);

  @override
  Widget build(BuildContext context) {
    String cultureOf = Utils.welcomeMsg + cityName!;
    final Padding? padding;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.culture.toUpperCase(),
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
            padding: EdgeInsets.all(Utils.size_02),
            child: SingleChildScrollView(
              child: GlassBox(
                padding: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Utils.size_16),
                      gradient: RadialGradient(
                        focalRadius: 9,
                        colors: [
                          Color(Utils.colorRed),
                          Color(Utils.colorOrange),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(Utils.size_16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Utils.size_16),
                            child: Image.asset(
                              cityImg!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Utils.size_16),
                          child: Text(
                            cultureOf,
                            style: TextStyle(
                              fontSize: Utils.size_20,
                              fontWeight: FontWeight.bold,
                              color: Color(Utils.colorWhite),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Utils.size_16),
                          child: Column(
                            children: [
                              Text(
                                cityCulture!,
                                style: TextStyle(
                                  fontSize: Utils.size_16,
                                  color: Color(Utils.colorWhite),
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  Utils.readMore,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(Utils.colorBlue),
                                    fontSize: Utils.size_16,
                                  ),
                                ),
                                onTap: () {
                                  launch(cultureWeb!);
                                },
                              ),
                            ],
                          ),
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
