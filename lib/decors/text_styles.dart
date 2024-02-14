//TextStyles

import 'package:Bsync/decors/colors.dart';

import 'package:flutter/material.dart';

class Styles {
  //
  static TextStyle regularStyle = TextStyle(
    color: AppColors.appDarkBlue,
    fontSize: 16,
    fontFamily: 'Inter',
    shadows: [
      Shadow(
          color: AppColors.appDarkBlue.withOpacity(0.2),
          offset: Offset(0.1, 0.1),
          blurRadius: 0.5),
    ],
  );
  //
  static TextStyle titleStyle = TextStyle(
    color: AppColors.appDarkBlue,
    fontSize: 26,
    fontFamily: 'Inter',
    shadows: [
      Shadow(
          color: AppColors.appDarkBlue.withOpacity(0.5),
          offset: Offset(0.1, 0.1),
          blurRadius: 0.5)
    ],
  );
  static TextStyle subtitleStyle = TextStyle(
    color: AppColors.appDarkBlue,
    fontSize: 14,
    shadows: [
      Shadow(
          color: AppColors.appDarkBlue.withOpacity(0.5),
          offset: Offset(0.1, 0.8),
          blurRadius: 0.5)
    ],
  );
}
