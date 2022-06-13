import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFE7DED9);
const kSecondaryColor = Color(0xFF988780);
const kSecColor = Color(0xE6988780);
const kPopUpColor = Color(0xF1E7DED9);

TextStyle kCustomText(
        {double fontSize = 16.0,
        required Color color,
        FontWeight fontWeight = FontWeight.normal}) =>
    TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
