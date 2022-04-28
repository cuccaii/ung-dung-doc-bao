import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/settings/local_Widget/list_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff34e2eb),
        actions: [builtBuilder()],
      ),
      endDrawer: ListDrawer(overlay: overlay),
      body: Center(
        child:
            SpinKitCircle(color: Colors.pink, duration: Duration(seconds: 2)),
      ),
    );
  }

  Builder builtBuilder() {
    return Builder(
        builder: (context) => Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  tooltip: 'Account',
                  icon: Icon(
                    Icons.account_circle,
                    size: 30,
                  )),
            ));
  }
}
