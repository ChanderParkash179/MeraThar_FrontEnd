import 'package:flutter/material.dart';
import 'package:front_app/Model/TouristPointModel/TouristPoint.dart';
import 'package:front_app/Service/TouristPointService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/GlassBox.dart';
import 'package:url_launcher/url_launcher.dart';

class TouristPointView extends StatefulWidget {
  final String? cityName;

  TouristPointView({this.cityName});

  @override
  State<TouristPointView> createState() => _TouristPointViewState();
}

class _TouristPointViewState extends State<TouristPointView> {
  final TouristPointService service = TouristPointService();
  late Future<Response> _future;

  @override
  void initState() {
    super.initState();
    _future = service.getTouristPointsByCityName(widget.cityName.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Padding? padding;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.visitingPoint.toUpperCase(),
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
              image: DecorationImage(
                  image: AssetImage(Utils.bg_img), fit: BoxFit.cover),
            ),
            child: FutureBuilder<Response>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final responseData = snapshot.data!.responseData;
                  return ListView.builder(
                    itemCount: responseData.places.length,
                    itemBuilder: (context, index) {
                      final place = responseData.places[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Utils.size_06),
                        child: Column(
                          children: [
                            GlassBox(
                              padding: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Utils.size_08,
                                  vertical: Utils.size_14,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonWidgets().verticalSize(10),
                                    Text(
                                      place.name,
                                      style: TextStyle(
                                          color: Color(Utils.colorWhite),
                                          fontSize: Utils.size_16),
                                    ),
                                    CommonWidgets().verticalSize(10),
                                    Text(
                                      place.description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(Utils.colorWhite),
                                          fontSize: Utils.size_14),
                                    ),
                                    CommonWidgets().verticalSize(10),
                                    GestureDetector(
                                      child: Text(
                                        Utils.location,
                                        style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Utils.size_12,
                                          decoration: TextDecoration.underline,
                                          color: Color(Utils.colorBlack),
                                        ),
                                      ),
                                      onTap: () {
                                        launch(place.location);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CommonWidgets().verticalSize(10),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Color(Utils.colorOrange),
                              indent: Utils.size_50,
                              endIndent: Utils.size_50,
                            ),
                            CommonWidgets().verticalSize(10),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        'Error: ${snapshot.error} : cityName: ${widget.cityName.toString()}'),
                  );
                } else {
                  return const Center(
                    child: Text('No data available.'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
