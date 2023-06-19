import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class ButtonImageWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String imagePath;

  const ButtonImageWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        width: MediaQuery.of(context).size.width * .75,
        padding: EdgeInsets.all(Utils.size_24),
        margin: EdgeInsets.symmetric(horizontal: Utils.size_24),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(imagePath),
            opacity: .9,
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontSize: Utils.size_16,
              color: Color(Utils.colorWhite),
            ),
          ),
        ),
      ),
    );
  }
}
