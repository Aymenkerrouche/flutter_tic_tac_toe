// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:xo_game/const.dart';
import 'package:xo_game/home_page_auto.dart';
import 'package:xo_game/home_page_manuel.dart';
import 'package:xo_game/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
