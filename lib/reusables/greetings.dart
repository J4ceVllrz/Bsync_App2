import 'package:bsync_app2/decors/colors.dart';
import 'package:bsync_app2/decors/text_styles.dart';
import 'package:bsync_app2/reusables/date.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Greetings extends StatefulWidget {
  const Greetings({super.key});

  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, Steve Francis",
            style: Styles.titleStyle.copyWith(
                fontSize: 20,
                color: AppColors.appWhite,
                height: 0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold),
          ),
          Gap(5),
          Text(DateUtility.formattedCurrentDate,
              style: Styles.regularStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.appWhite.withOpacity(0.7),
                  height: 0)),
        ],
      ),
    );
  }
}
