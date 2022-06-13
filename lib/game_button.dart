// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class GameButton {
  final id;
  String text;
  Color clr;
  bool enabled;

  GameButton(
      {this.id,
      this.text = "",
      this.clr = const Color(0xFF988686),
      this.enabled = true});
}
