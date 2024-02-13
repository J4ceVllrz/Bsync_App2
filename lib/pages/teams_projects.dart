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
                offset: const Offset(0.1, 0.8),
                blurRadius: 0.5,
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.appWhite,
      ),
      drawer: MenuDrawer(),
      backgroundColor: AppColors.appWhite,
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            shrinkWrap: true,
            children: List.generate(4, (index) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: AppColors.appRed,
                  ));
            }),
          )),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: TabBar(controller: _tabController, tabs: [
                Tab(
                  text: "Projects",
                ),
                Tab(
                  text: "Teams",
                )
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 600,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
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
