import 'package:flutter/material.dart';
import 'package:front_app/Model/HotelModel/Hotel.dart';
import 'package:front_app/Service/HotelService.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';
import 'package:front_app/Widgets/GlassBox.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelView extends StatefulWidget {
  final String? cityName;

  HotelView({this.cityName});

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  final HotelService service = HotelService();
  late Future<Response> _future;

  @override
  void initState() {
    super.initState();
    _future = service.getHotelByCityName(widget.cityName.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Padding? padding;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Utils.hotels.toUpperCase(),
            style: TextStyle(
              letterSpacing: 1.2,
              fontSize: Utils.size_18,
              fontWeight: FontWeight.bold,
              color: Color(Utils.colorWhite),
            ),
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
                    itemCount: responseData.hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = responseData.hotels[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Utils.size_06),
                        child: Column(
                          children: [
                            GlassBox(
                              padding: Padding(
                                padding: EdgeInsets.all(Utils.size_12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonWidgets().verticalSize(Utils.size_10),
                                    Text(
                                      hotel.name.toString(),
                                      style: TextStyle(
                                          color: Color(Utils.colorWhite),
                                          fontSize: Utils.size_16),
                                    ),
                                    CommonWidgets().verticalSize(Utils.size_10),
                                    Text(
                                      hotel.phone.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(Utils.colorWhite),
                                          fontSize: Utils.size_14),
                                    ),
                                    CommonWidgets().verticalSize(Utils.size_10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(Utils.colorYellow),
                                        ),
                                        CommonWidgets()
                                            .horizontalSize(Utils.size_04),
                                        Text(
                                          hotel.rating.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(Utils.colorWhite),
                                              fontSize: Utils.size_14),
                                        ),
                                      ],
                                    ),
                                    CommonWidgets().verticalSize(Utils.size_10),
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
                                        launch(hotel.address.toString());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CommonWidgets().verticalSize(Utils.size_10),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Color(Utils.colorOrange),
                              indent: Utils.size_50,
                              endIndent: Utils.size_50,
                            ),
                            CommonWidgets().verticalSize(Utils.size_10),
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
