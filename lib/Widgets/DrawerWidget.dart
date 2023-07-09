import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_app/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  final String? email;
  DrawerWidget({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                email.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Utils.size_16,
                  color: Color(
                    Utils.colorBlack,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.signOut,
              color: Color(Utils.colorBlack),
            ),
            onTap: () async {
              Get.toNamed("/loginView");
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.remove(Utils.EMAIL);
              sp.remove(Utils.KEY_LOGIN);
            },
          )
        ],
      ),
    );
  }
}
