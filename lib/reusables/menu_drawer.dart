import 'package:bsync_app2/decors/colors.dart';
import 'package:bsync_app2/pages/home_page.dart';
import 'package:bsync_app2/pages/teams_projects.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.appWhite,
        child: ListView(
          children: [
            Container(
              height: 250,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(color: AppColors.appDarkBlue),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(25),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: AppColors.appWhite, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                leading: Icon(Icons.home_rounded),
                title: Text("Home"),
              ),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TeamsAndProjects(),
                  ));
                },
                leading: Icon(Icons.task_rounded),
                title: Text("Teams and Projects"),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.settings_rounded),
                title: Text("Settings"),
              ),
            )
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
