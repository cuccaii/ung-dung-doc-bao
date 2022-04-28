import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/login/local_Widget/input_password.dart';
import 'package:flutter_newspaper_reading_app/screens/login/local_Widget/login_button.dart';

import '../../../const/config.dart';
import '../../../widgets/input_textFormField.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _statePass = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildTextFormField(),
                LoginButton(
                    formKey: _formKey,
                    // overlay: overlay,
                    emailController: _emailController,
                    passController: _passwordController)
              ],
            )),
      ),
    );
  }

  Column buildTextFormField() {
    return Column(
      children: [
        InputTextFormField(
          textController: _emailController,
          hintText: 'Email',
          label: 'Email',
          prefixIcon: Icon(
            Icons.email,
            color: kPrimaryColor,
          ),
          obsecureText: false,
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
        SizedBox(
          height: 10.0,
        ),
        InputPassWord(
          hintText: 'Password',
          label: 'Password',
          textController: _passwordController,
          obsecureText: _statePass,
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xff34e2eb),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _statePass = !_statePass;
              });
            },
            icon: _statePass
                ? Icon(
                    Icons.visibility,
                    color: Color(0xff34e2eb),
                  )
                : Icon(
                    Icons.visibility_off,
                    color: Color(0xff34e2eb),
                  ),
          ),
          validator: (value) {
            if (value.toString().length < 6) {
              return 'Password should be longer or equal to 6 characters.';
            }
            return null;
          },
        )
      ],
    );
  }
}
