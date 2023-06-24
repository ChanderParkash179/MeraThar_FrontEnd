import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Utils/Utils.dart';

class GridViewButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final FaIcon? icon;

  const GridViewButtonWidget(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(
          Utils.size_12,
          Utils.size_08,
          Utils.size_12,
          Utils.size_08,
        ),
        decoration: BoxDecoration(
          color: Color(Utils.primaryColor),
          borderRadius: BorderRadius.circular(Utils.size_08),
        ),
        child: Center(
          child: icon!,
        ),
      ),
    );
  }
}
