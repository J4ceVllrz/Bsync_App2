import 'package:Bsync/decors/colors.dart';
import 'package:Bsync/decors/text_styles.dart';
import 'package:Bsync/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          gradient: AppGradients.redOrange,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 50,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: Styles.titleStyle
                      .copyWith(fontSize: 26, color: AppColors.appWhite),
                ),
              ),
            ),
            const Gap(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5),
                          child: Icon(
                            LineAwesomeIcons.user,
                            color: AppColors.appWhite,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.appWhite)),
                        hintText: "Email address",
                        hintStyle: TextStyle(color: AppColors.appWhite)),
                  ),
                  Gap(10),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5),
                        child: Icon(
                          LineAwesomeIcons.key,
                          color: AppColors.appWhite,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      hintStyle: TextStyle(color: AppColors.appWhite),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Container(
                      width: size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: AppGradients.redOrange,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appDarkBlue.withOpacity(0.4),
                            offset: const Offset(0.1, 0.1),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Sign in",
                            style: Styles.regularStyle
                                .copyWith(color: AppColors.appWhite),
                          )),
                    ),
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
