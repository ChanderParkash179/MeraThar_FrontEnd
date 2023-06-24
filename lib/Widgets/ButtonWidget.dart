import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const ButtonWidget({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color(Utils.primaryColor),
          borderRadius: BorderRadius.circular(8),
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
