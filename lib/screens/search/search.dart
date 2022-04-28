import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/screens/search/local_Widget/search_button.dart';
import 'package:get/get.dart';

import 'search_results.dart';

class Search extends StatefulWidget {
  String? search;
  Search({this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  bool _searchState = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                builtSearchFormField(),
                SizedBox(
                  height: 20.0,
                ),
                SearchButton(formKey: _formKey, widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding builtSearchFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: TextFormField(
        onTap: () {
          setState(() {
            _searchState = !_searchState;
          });
        },
        onChanged: (newValue) {
          setState(() {
            widget.search = newValue;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter some text';
          }
          return null;
        },
        controller: _searchController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
            hintText: 'Search',
            label: Text('Search'),
            suffixIcon: _searchState
                ? null
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _searchState = !_searchState;
                        _searchController.clear();
                      });
                    },
                    icon: Icon(Icons.clear))),
      ),
    );
  }
}
