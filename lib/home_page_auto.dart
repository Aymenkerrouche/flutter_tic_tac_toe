// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_new, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, no_logic_in_create_state, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:xo_game/const.dart';
import 'package:xo_game/game_button.dart';
import 'package:xo_game/popup.dart';
import 'dart:math';

class HomePageAuto extends StatefulWidget {
  @override
  _HomePageAutoState createState() => _HomePageAutoState();
}

class _HomePageAutoState extends State<HomePageAuto> {
  late List<GameButton> listButtton;
  var player1;
  var player2;
  var activePlayer;
  var scoreX = 0;
  var scoreO = 0;

  @override
  void initState() {
    super.initState();
    listButtton = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.clr = const Color(0xFFE0A8A5);
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.clr = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;

      int winner = checkWinner();
      if (winner == -1) {
        if (listButtton.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => PopUp("draw", "Press Replay to restart", reset));
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var vide = [];
    var list = List.generate(9, (i) => i + 1);
    for (var gridVide in list) {
      if (!(player1.contains(gridVide) || player2.contains(gridVide))) {
        vide.add(gridVide);
      }
    }

    var r = Random();
    var randomIndex = r.nextInt(vide.length - 1);
    var cellID = vide[randomIndex];
    int i = listButtton.indexWhere((v) => v.id == cellID);
    playGame(listButtton[i]);
  }

  int checkWinner() {
    var winner = -1;

    //Player X won

    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }

    //Player O won
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        scoreX += 1;
        showDialog(
            context: context,
            builder: (_) => PopUp("X win !", "Press Replay to restart", reset));
      } else {
        scoreO += 1;
        showDialog(
            context: context,
            builder: (_) => PopUp("O win !", "Press Replay to restart", reset));
      }
    }

    return winner;
  }

  void reset() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      listButtton = doInit();
    });
  }

  void resetAll() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      listButtton = doInit();
      scoreO = 0;
      scoreX = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.2),
            child: Icon(
              Icons.circle_outlined,
              size: 25,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.19),
              child: Icon(
                Icons.clear,
                size: 35,
              ),
            )
          ],
          title: Text(
            "TIC TOC TOE",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
          elevation: 20,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player O',
                        style: kCustomText(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        scoreO.toString(),
                        style: kCustomText(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Player O',
                        style: kCustomText(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        scoreX.toString(),
                        style: kCustomText(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: size.width * 0.07,
                    mainAxisSpacing: size.width * 0.07),
                itemCount: listButtton.length,
                itemBuilder: (context, i) => RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  onPressed: listButtton[i].enabled
                      ? () => playGame(listButtton[i])
                      : null,
                  color: listButtton[i].clr,
                  disabledColor: listButtton[i].clr,
                  child: Text(
                    listButtton[i].text,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.15,
                    vertical: size.height * 0.04),
                child: RaisedButton(
                  elevation: 20,
                  color: kSecondaryColor,
                  padding: EdgeInsets.all(
                    size.height * 0.02,
                  ),
                  onPressed: resetAll,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Change mode",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
