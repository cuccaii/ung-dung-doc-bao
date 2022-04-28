import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/reset_password/local_Widget/reset_pass_form.dart';

import 'package:flutter_newspaper_reading_app/widgets/input_textFormField.dart';
import 'package:flutter_newspaper_reading_app/widgets/round_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const/config.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResetFormField(),
          builtText(),
        ],
      ),
    );
  }

  Padding builtText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text('We will send your email so you can recover your password.'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(' Please check your email inbox!'),
          )
        ],
      ),
    );
  }
}
