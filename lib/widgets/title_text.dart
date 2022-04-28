import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title!,
        style: const TextStyle(
            color: Colors.black,
            // backgroundColor: Colors.white,
            fontSize: 25,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
