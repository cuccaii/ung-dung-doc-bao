import 'package:flutter/material.dart';

import '../../../const/config.dart';

class InputPassWord extends StatefulWidget {
  const InputPassWord(
      {Key? key,
      this.textController,
      this.hintText,
      this.obsecureText,
      this.validator,
      this.label,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? textController;
  final String? hintText;
  final bool? obsecureText;
  final validator;
  final String? label;
  final prefixIcon;
  final suffixIcon;

  @override
  State<InputPassWord> createState() => _InputPassWordState();
}

class _InputPassWordState extends State<InputPassWord> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.textController,
      obscureText: widget.obsecureText!,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        label: Text(widget.label!),
        suffixIcon: widget.suffixIcon,
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
