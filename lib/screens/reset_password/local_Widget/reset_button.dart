import 'package:flutter/material.dart';

import '../../../services/firebase/auth_controller.dart';
import '../../../emotion/load.dart';
import '../../../widgets/round_elevated_button.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
    required TextEditingController forgotpass,
    required GlobalKey<FormState> formKey,
  })  : _forgotpass = forgotpass,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _forgotpass;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedElevatedButton(
          title: 'Send',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await overlay
                  .during(Future.delayed(const Duration(milliseconds: 1500)));
              AuthController.instance.restPass(_forgotpass.text.trim());
            }
          },
        ));
  }
}
