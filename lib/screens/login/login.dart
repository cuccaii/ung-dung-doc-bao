import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/const/config.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/reset_password/forgotpass.dart';
import 'package:flutter_newspaper_reading_app/screens/home/home.dart';
import 'package:flutter_newspaper_reading_app/screens/register/register.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../widgets/input_textFormField.dart';
import '../../widgets/round_elevated_button.dart';
import '../../widgets/title_text.dart';
import 'local_Widget/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool load = false;
  bool _statePass = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(
                      title: 'Welcome to read the newspaper',
                    ),
                  ],
                ),
                width: double.infinity,
                height: _height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientColors),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    LoginForm(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



/*
Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          TextButton(
                              onPressed: () {
                                Get.to(() => ForgotPass());
                              },
                              child: const Text(
                                'Forgot password',
                              )),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await overlay.during(Future.delayed(
                              const Duration(milliseconds: 1500)));
                          AuthController.instance.login(
                              emailController.text.trim(),
                              passController.text.trim());
                          // Get.to(() => HomePage());
                        }
                      },
                      child: const Text(
                        'Log in',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0x9934e2eb),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          minimumSize: const Size(150, 50)),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account ?'),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => SignUp());
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ])),
                    Text(
                      'Login with other accounts:',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.blue[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 20,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundImage:
                                    const AssetImage('assets/images/g.png'),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 20,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundImage:
                                    AssetImage('assets/images/t.png'),
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20,
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage:
                                  AssetImage('assets/images/f.png'),
                            ),
                          )
                        ],
                      ),
                    )

*/