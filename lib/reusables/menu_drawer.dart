import 'package:Bsync/authen_page/login_page.dart';
import 'package:Bsync/decors/colors.dart';
import 'package:Bsync/decors/text_styles.dart';
import 'package:Bsync/pages/home_page.dart';
import 'package:Bsync/pages/teams_projects.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 4,
              child: DrawerHeader(
                curve: Curves.easeInCubic,
                decoration: const BoxDecoration(
                  gradient: AppGradients.redOrange,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: AppColors.appRed, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
              leading: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.appDarkBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LineAwesomeIcons.home,
                    color: AppColors.appWhite,
                  )),
              title: Text(
                textScaler: TextScaler.noScaling,
                "Home",
                style: Styles.regularStyle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(10),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TeamsAndProjects(),
                ));
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.appDarkBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LineAwesomeIcons.tasks,
                  color: AppColors.appWhite,
                ),
              ),
              title: Text(
                textScaler: TextScaler.noScaling,
                "Teams and Projects",
                style: Styles.regularStyle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(10),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.appDarkBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LineAwesomeIcons.cog,
                  color: AppColors.appWhite,
                ),
              ),
              title: Text(
                textScaler: TextScaler.noScaling,
                "Settings",
                style: Styles.regularStyle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              leading: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: AppColors.appRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LineAwesomeIcons.alternate_sign_out,
                  color: AppColors.appWhite,
                ),
              ),
              title: Text(
                textScaler: TextScaler.noScaling,
                "Logout",
                style: Styles.regularStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appRed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget menuSide(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 15, left: 20),
        padding: const EdgeInsets.all(3.0),
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.appDarkBlue,
          boxShadow: [
            BoxShadow(
              color: AppColors.appDarkBlue.withOpacity(0.5),
              offset: const Offset(0.2, 0.2),
              blurRadius: 0.5,
            )
          ],
        ),
        child: Icon(
          Icons.menu,
          size: 20,
          color: AppColors.appWhite,
        ),
      ),
    ],
  );
}
