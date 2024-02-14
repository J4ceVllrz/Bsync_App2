//Colors

import 'package:flutter/material.dart';

class AppColors {
  // static const Color appWhite = Color(0xffF0F0F5);
  static const Color appWhite = Color(0xffF3F1FC);
  static const Color appDarkBlue = Color(0xff273B4A);
  static const Color appBlue = Color(0xff0392CE);
  static const Color appRed = Color(0xffAE2F5C);
  static const Color appYellow = Color(0xffFABC02);
  static const Color appPink = Color(0xffEA4B7E);
  static const Color appOrange = Color(0xffF29560);
  static const Color appBlue1 = Color(0xff21CDFB);
}

class AppGradients {
  static const Gradient redOrange = LinearGradient(colors: [
    Color(0xffF29560),
    Color(0xffEA4B7E),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const Gradient violetBlue = LinearGradient(colors: [
    Color(0xff21CDFB),
    Color(0xffB223FF),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
