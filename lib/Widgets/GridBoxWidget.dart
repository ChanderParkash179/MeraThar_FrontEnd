import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class GridBoxWidget {
  Container gridBox(String title, Color color, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.size_20),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(
              color: Color(Utils.colorWhite),
              fontSize: Utils.size_24,
            ),
          ),
        ],
      ),
    );
  }
}
