import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:front_app/Widgets/CommonWidgets.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final Icon? icon;
  final double? height;
  final double? width;

  const ButtonWidget({
    super.key,
    required this.onTap,
    this.title,
    this.icon,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Utils.size_24),
        margin: EdgeInsets.symmetric(horizontal: Utils.size_24),
        decoration: BoxDecoration(
          color: Color(Utils.primaryColor),
          borderRadius: BorderRadius.circular(Utils.size_08),
        ),
        child: Center(
          child: Container(height: height, width: width, child: icon!),
        ),
      ),
    );
  }
}
