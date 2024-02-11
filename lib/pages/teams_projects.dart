import 'package:bsync_app2/decors/colors.dart';
import 'package:bsync_app2/decors/text_styles.dart';
import 'package:bsync_app2/reusables/menu_drawer.dart';
import 'package:flutter/material.dart';

class TeamsAndProjects extends StatefulWidget {
  const TeamsAndProjects({super.key});

  @override
  State<TeamsAndProjects> createState() => _TeamsAndProjectsState();
}

class _TeamsAndProjectsState extends State<TeamsAndProjects>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: menuSide(context),
          );
        }),
        title: Text(
          "Teams and Projects",
          style: Styles.regularStyle.copyWith(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: [
              Shadow(
                color: AppColors.appDarkBlue.withOpacity(0.5),
                offset: Offset(0.1, 0.8),
                blurRadius: 0.5,
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.appWhite,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Projects',
            ),
            Tab(text: 'Teams'),
          ],
        ),
      ),
      drawer: MenuDrawer(),
      backgroundColor: AppColors.appWhite,
      body: Container(
        child: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: TabBarView(
                physics: ClampingScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.blueGrey,
                    child: Text(
                      "Projects",
                      style: Styles.titleStyle,
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    child: Text("tea,sss"),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
