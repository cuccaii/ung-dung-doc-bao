import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/screens/search/search_results.dart';
import 'package:flutter_newspaper_reading_app/screens/search/search.dart';
import 'package:get/get.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.widget,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Search widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color(0xff34e2eb),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: Size(150, 50)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.to(() => SearchResults(), arguments: widget.search);
        }
      },
      child: Text(
        'Search',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
