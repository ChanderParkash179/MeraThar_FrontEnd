import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class AppBackground extends StatelessWidget {
  final Padding? padding;

  AppBackground({this.padding});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Utils.bg_img),
              fit: BoxFit.cover,
              // opacity: .1,
            )
                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(Utils.primaryColor),
                //     Color(Utils.secondaryColor),
                //   ],
                // ),
                ),
            child: padding,
          ),
        ],
      ),
    );
  }
}
