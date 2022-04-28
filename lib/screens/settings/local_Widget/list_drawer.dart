import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';

import 'package:flutter_newspaper_reading_app/screens/settings/local_Widget/log_out_button.dart';
import 'package:get/get.dart';

import '../../../emotion/load.dart';

class ListDrawer extends StatelessWidget {
  const ListDrawer({
    Key? key,
    required this.overlay,
  }) : super(key: key);

  final LoadingOverlay overlay;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Center(
              child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/profile1.png')),
          )),
          decoration: BoxDecoration(
            color: Color(0xff34e2eb),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(''),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text('')),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text('')),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            'Phone',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
            leading: Icon(Icons.support),
            title: Text(
              'Support',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(
              'Screen color',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setings', style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.abc),
          title: Text(
            'Language',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        LogOutButton(overlay: overlay)
      ],
    ));
  }
}
