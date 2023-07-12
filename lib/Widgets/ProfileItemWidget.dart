import 'package:flutter/material.dart';
import 'package:front_app/Utils/Utils.dart';

class ProfileItemWidget {
  static profileItem(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Utils.size_10),
          boxShadow: [
            BoxShadow(
                offset: Offset(Utils.size_00, Utils.size_06),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
