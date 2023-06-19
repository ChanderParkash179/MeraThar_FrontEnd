import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utils.size_24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(Utils.colorWhite)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(Utils.colorGreyShade400)),
            ),
            fillColor: Color(Utils.colorGreyShade200),
            filled: true,
            hintText: hintText),
        obscureText: obsecureText,
      ),
    );
  }
}
