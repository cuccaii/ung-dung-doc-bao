import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/const/config.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    Key? key,
    this.textController,
    this.hintText,
    this.obsecureText,
    this.validator,
    this.label,
    this.prefixIcon,
  }) : super(key: key);

  final TextEditingController? textController;
  final String? hintText;
  final bool? obsecureText;
  final validator;
  final String? label;
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      obscureText: obsecureText!,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        label: Text(label!),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(30.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: kPrimaryColor)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
