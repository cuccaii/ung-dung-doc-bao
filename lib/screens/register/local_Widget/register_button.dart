import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/widgets/round_elevated_button.dart';

import '../../../services/firebase/auth_controller.dart';
import '../../../emotion/load.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.overlay,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController phoneController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _phoneController = phoneController,
        super(key: key);

  final LoadingOverlay overlay;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return RoundedElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            String name = _nameController.text.trim();
            String email = _emailController.text.trim();
            String password = _passwordController.text;
            String phone = _phoneController.text;
            await overlay
                .during(Future.delayed(const Duration(milliseconds: 1500)));
            AuthController.instance.register(email, password);
          }
        },
        title: 'Register');
  }
}
