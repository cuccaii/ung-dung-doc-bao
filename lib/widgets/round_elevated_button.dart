import 'package:flutter/material.dart';

import '../services/firebase/auth_controller.dart';
import '../emotion/load.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    Key? key,
    this.onPressed,
    this.title,
  }) : super(key: key);
  final String? title;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          primary: const Color(0x9934e2eb),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: const Size(150, 50)),
    );
  }
}
