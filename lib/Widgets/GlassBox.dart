import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class GlassBox extends StatelessWidget {
  final Padding? padding;
  GlassBox({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Utils.size_16,
        Utils.size_04,
        Utils.size_16,
        Utils.size_04,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Utils.size_06),
        child: Container(
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
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(Utils.colorWhite).withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(Utils.size_20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(Utils.secondaryColor).withOpacity(0.1),
                      Color(Utils.primaryColor).withOpacity(0.1),
                    ],
                  ),
                ),
                child: padding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
