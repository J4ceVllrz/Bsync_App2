import 'package:Bsync/decors/colors.dart';
import 'package:Bsync/decors/text_styles.dart';
import 'package:Bsync/reusables/menu_drawer.dart';
import 'package:flutter/material.dart';

class TeamsAndProjects extends StatefulWidget {
  const TeamsAndProjects({super.key});

  @override
  State<TeamsAndProjects> createState() => _TeamsAndProjectsState();
}

class _TeamsAndProjectsState extends State<TeamsAndProjects>
    with TickerProviderStateMixin {
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
    // List<String> tabs = [
    //   "Projects",
    //   "Teams",
    // ];

    // final size = MediaQuery.of(context).size;

    //
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: menuSide(context),
          );
        }),
        backgroundColor: AppColors.appWhite,
      ),
      drawer: const MenuDrawer(),
      backgroundColor: AppColors.appWhite,
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 30.0)),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.left,
                "Teams and Projects",
                style: Styles.regularStyle.copyWith(
                  letterSpacing: 0,
                  wordSpacing: 0,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      color: AppColors.appDarkBlue.withOpacity(0.5),
                      offset: const Offset(0.1, 0.1),
                      blurRadius: 0.3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: 20, left: 20),
                  isScrollable: true,
                  unselectedLabelColor: AppColors.appDarkBlue,
                  labelColor: AppColors.appRed,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.appRed, radius: 4),
                  tabs: [
                    Tab(
                      text: "Projects",
                    ),
                    Tab(
                      text: "Teams",
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 300,
              child: TabBarView(controller: _tabController, children: [
                Text("data"),
                Text("23123123"),
              ]),
            ),
          ),
        ],
      )),
    );
  }
}

class CircleTabIndicator extends Decoration {
  //
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  //
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius - 2);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
