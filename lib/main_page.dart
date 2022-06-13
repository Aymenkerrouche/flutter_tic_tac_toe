// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xo_game/const.dart';
import 'package:xo_game/home_page_manuel.dart';
import 'package:xo_game/home_page_auto.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecColor, kPrimaryColor, kSecColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05, right: size.width * 0.08),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.settings),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: size.height * 0.3,
                    width: size.width * 0.5,
                    alignment: Alignment.center,
                    image: AssetImage("assets/x o.png"),
                  ),
                  SizedBox(height: 50.0),
                  Stack(
                    children: <Widget>[
                      Text(
                        "Let's start your adventure",
                        style: TextStyle(
                          fontSize: 20,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.brown,
                        ),
                      ),
                      Text(
                        "Let's start your adventure",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: Text('2 players'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageManuel(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: Text('1 player'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageAuto(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
