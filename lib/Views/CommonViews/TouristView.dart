import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/ButtonImageWidget.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:get/get.dart';

class TouristView extends StatefulWidget {
  const TouristView({Key? key}) : super(key: key);

  @override
  State<TouristView> createState() => _TouristViewState();
}

class _TouristViewState extends State<TouristView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.citiesPage.toUpperCase(),
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonImageWidget(
                        onTap: () {
                          setState(() {
                            Get.toNamed('/umerkotView');
                          });
                        },
                        imagePath: Utils.umerkot_icon_img,
                        title: Utils.umerkot.toUpperCase(),
                      ),
                      CommonWidgets().verticalSize(Utils.size_12),
                      ButtonImageWidget(
                        onTap: () {
                          setState(() {
                            Get.toNamed('/mithiView');
                          });
                        },
                        imagePath: Utils.mithi_icon_img,
                        title: Utils.mithi.toUpperCase(),
                      ),
                      CommonWidgets().verticalSize(Utils.size_12),
                      ButtonImageWidget(
                        onTap: () {
                          setState(() {
                            Get.toNamed('/nagarparkarView');
                          });
                        },
                        imagePath: Utils.nagarparkar_icon_img,
                        title: Utils.nagarparkar.toUpperCase(),
                      ),
                    ],
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
