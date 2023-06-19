import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class HotelView extends StatefulWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Color(Utils.colorBlack),
            color: Color(Utils.colorOrange),
            child: SizedBox(
              width: Utils.size_300,
              height: Utils.size_350,
              child: Padding(
                padding: EdgeInsets.all(Utils.size_20),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(Utils.colorGreyShade400),
                      radius: Utils.size_60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Utils.nagarparkar_icon_img),
                        radius: Utils.size_54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Utils.appTitle,
                      style: TextStyle(
                        fontSize: Utils.size_30,
                        color: Color(Utils.colorWhite),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: Utils.size_10,
                    ),
                    Text(
                      Utils.appTitle,
                      style: TextStyle(
                        fontSize: Utils.size_14,
                        color: Color(Utils.primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: Utils.size_10,
                    ),
                    ElevatedButton(
                      onPressed: () => 'Null',
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(Utils.colorGreenAccent),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Utils.size_04),
                        child: Row(
                          children: [
                            const Icon(Icons.touch_app),
                            Text(Utils.appTitle)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
