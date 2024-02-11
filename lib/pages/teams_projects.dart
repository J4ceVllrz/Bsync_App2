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
            fontSize: 16,
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Container(
                  child: Text("Projects"),
                ),
              ),
              Tab(text: 'Teams'),
            ],
          ),
        ),
      ),
      drawer: MenuDrawer(),
      backgroundColor: AppColors.appWhite,
      body: SafeArea(
          child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.appDarkBlue,
              child: Text("Something here"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: TabBarView(
                physics: ScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appDarkBlue.withOpacity(0.5),
                            offset: const Offset(0.2, 0.2),
                            blurRadius: 0.5,
                          )
                        ]),
                    child: Text(
                      "Projects content",
                      textAlign: TextAlign.center,
                      style: Styles.titleStyle,
                    ),
                  ),
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appDarkBlue.withOpacity(0.5),
                            offset: const Offset(0.2, 0.2),
                            blurRadius: 0.5,
                          )
                        ]),
                    child: Text(
                      "Teams content",
                      textAlign: TextAlign.center,
                      style: Styles.titleStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Text("Reserved"),
            ),
          )
        ],
      )),
    );
  }
}
