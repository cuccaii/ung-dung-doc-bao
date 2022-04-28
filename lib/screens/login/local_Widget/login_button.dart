import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/widgets/round_elevated_button.dart';

import '../../../services/firebase/auth_controller.dart';
import '../../../emotion/load.dart';
import '../../reset_password/forgotpass.dart';
import 'package:get/get.dart';

import '../../register/register.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    // required this.overlay,
    required this.emailController,
    required this.passController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  //final LoadingOverlay overlay;
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Column(
      children: [
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
        RoundedElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await overlay
                  .during(Future.delayed(const Duration(milliseconds: 1500)));
              AuthController.instance.login(
                  emailController.text.trim(), passController.text.trim());
            }
          },
          title: 'Log in',
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Don\'t have an account ?'),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignUp());
                  },
                  child: const Text(
                    'Register',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ))
            ])),
        Text(
          'Login with other accounts:',
          style:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.blue[400]),
        ),
        builtOtherAccount()
      ],
    );
  }

  Padding builtOtherAccount() {
    return Padding(
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
                backgroundImage: const AssetImage('assets/images/g.png'),
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
                backgroundImage: AssetImage('assets/images/t.png'),
              ),
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('assets/images/f.png'),
            ),
          )
        ],
      ),
    );
  }
}
