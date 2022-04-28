import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/const/config.dart';
import 'package:flutter_newspaper_reading_app/services/api/everything/everything_view.dart';
import 'package:flutter_newspaper_reading_app/services/api/topheadline_news/topheadline_view.dart';
import 'package:flutter_newspaper_reading_app/services/firebase/auth_controller.dart';
import 'package:flutter_newspaper_reading_app/emotion/load.dart';
import 'package:flutter_newspaper_reading_app/screens/login/login.dart';
import 'package:flutter_newspaper_reading_app/screens/search/search.dart';
import 'package:flutter_newspaper_reading_app/screens/settings/settings.dart';
import 'package:flutter_newspaper_reading_app/screens/register/register.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screen = [EveryThingView(), TopHeadlineView(), Search(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff34e2eb),
        selectedItemColor: Colors.white,
        iconSize: 25,
        // unselectedFontSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Everything',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Top Headlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: _currentIndex,
        onTap: _onTapIndex,
      ),
    );
  }

  _onTapIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
