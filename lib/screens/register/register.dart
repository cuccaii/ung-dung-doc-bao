import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/home/home.dart';
import 'package:flutter_newspaper_reading_app/screens/login/local_Widget/input_password.dart';
import 'package:flutter_newspaper_reading_app/widgets/input_textFormField.dart';
import 'package:get/get.dart';

import 'local_Widget/register_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _statePass = true;
  bool _stateRepeatPass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff34e2eb),
        title: Center(child: Text('Sign Up')),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildFormField(),
              SizedBox(
                height: 10.0,
              ),
              RegisterButton(
                  formKey: _formKey,
                  overlay: overlay,
                  nameController: nameController,
                  phoneController: phoneController,
                  emailController: emailController,
                  passwordController: passwordController)
            ],
          ),
        ),
      ),
    );
  }

  Column buildFormField() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: InputTextFormField(
              textController: nameController,
              obsecureText: false,
              hintText: 'Username',
              label: 'Username',
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xff34e2eb),
              ),
              validator: (value) {
                if (value.toString().length <= 2) {
                  return 'Enter valid name.';
                }
                return null;
              },
            )),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: InputTextFormField(
              label: 'Phone number',
              obsecureText: false,
              textController: phoneController,
              hintText: 'Phone number',
              prefixIcon: Icon(
                Icons.phone,
                color: Color(0xff34e2eb),
              ),
              validator: (value) {
                bool _isPhoneValid =
                    RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!);
                if (!_isPhoneValid) {
                  return 'Invalid phone.';
                }
                return null;
              },
            )),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: InputTextFormField(
              label: 'Email',
              obsecureText: false,
              textController: emailController,
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff34e2eb),
              ),
              validator: (value) {
                bool _isEmailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (!_isEmailValid) {
                  return 'Invalid email.';
                }
                return null;
              },
            )),
        Padding(
            padding: const EdgeInsets.all(15),
            child: InputPassWord(
              textController: passwordController,
              hintText: 'Password',
              label: 'Password',
              obsecureText: _statePass,
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff34e2eb),
              ),
              validator: (value) {
                if (value.toString().length < 6) {
                  return 'Password should be longer or equal to 6 characters.';
                }
                return null;
              },
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
            )),
        Padding(
            padding: EdgeInsets.all(15),
            child: InputPassWord(
              textController: repeatController,
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff34e2eb),
              ),
              hintText: 'Confirm password',
              label: 'Confirm password',
              obsecureText: _stateRepeatPass,
              validator: (value) {
                if (value.trim() != passwordController.text.trim()) {
                  return 'Passwords does not match!';
                }

                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _stateRepeatPass = !_stateRepeatPass;
                  });
                },
                icon: _stateRepeatPass
                    ? Icon(
                        Icons.visibility,
                        color: Color(0xff34e2eb),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Color(0xff34e2eb),
                      ),
              ),
            )),
      ],
    );
  }
}
