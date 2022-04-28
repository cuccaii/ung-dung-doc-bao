import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:get/get.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
    required this.overlay,
  }) : super(key: key);

  final LoadingOverlay overlay;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Log out'),
                  content: Text('Do you want to log out ?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () async {
                          await overlay.during(
                              Future.delayed(Duration(milliseconds: 1000)));
                          AuthController.instance.logout();
                        },
                        child: Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No'))
                  ],
                ));
      },
      icon: Icon(
        Icons.logout,
        color: Colors.black,
      ),
      label: Text(
        'Log out',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Color(0x9934e2eb),
          shape: RoundedRectangleBorder(),
          minimumSize: Size(150.0, 50.0)),
    );
  }
}
