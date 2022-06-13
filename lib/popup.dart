// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:xo_game/const.dart';

class PopUp extends StatelessWidget {
  final titre;
  final content;
  final VoidCallback back;
  final reset;

  PopUp(this.titre, this.content, this.back, [this.reset = "Replay"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 100,
      backgroundColor: kPopUpColor,
      contentPadding: EdgeInsets.all(24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      title: Row(
        children: [
          Text(
            titre,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Icon(Icons.celebration_sharp),
          )
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            onPressed: back,
            color: Colors.black.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  reset,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.autorenew_outlined,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
