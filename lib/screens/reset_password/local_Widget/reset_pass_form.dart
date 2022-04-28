import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/screens/reset_password/local_Widget/reset_button.dart';

import '../../../const/config.dart';
import '../../../widgets/input_textFormField.dart';

class ResetFormField extends StatelessWidget {
  ResetFormField({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _forgotpass = TextEditingController();
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
          child: builtTextField(_forgotpass)),
      ResetButton(
        forgotpass: _forgotpass,
        formKey: _formKey,
      )
    ]);
  }

  builtTextField(TextEditingController _forgotpass) {
    return Form(
      key: _formKey,
      child: InputTextFormField(
        hintText: 'Email',
        label: 'Email',
        obsecureText: false,
        prefixIcon: Icon(
          Icons.email,
          color: kPrimaryColor,
        ),
        textController: _forgotpass,
        validator: (value) {
          bool _isEmailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (!_isEmailValid) {
            return 'Invalid email.';
          }
          return null;
        },
      ),
    );
  }
}
