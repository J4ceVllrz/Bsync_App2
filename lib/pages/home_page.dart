import 'package:bsync_app2/decors/colors.dart';
import 'package:bsync_app2/decors/text_styles.dart';
import 'package:bsync_app2/reusables/greetings.dart';
import 'package:gap/gap.dart';
import 'package:bsync_app2/reusables/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> assorted = [
    AppColors.appBlue,
    AppColors.appRed,
    AppColors.appYellow,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    EdgeInsets padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,

      backgroundColor: AppColors.appWhite,
      //AppBar
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
          "Home",
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
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: AppColors.appRed,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appDarkBlue.withOpacity(0.5),
                    offset: const Offset(0.2, 0.2),
                    blurRadius: 0.5,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Greetings(),
                    Gap(20),
                    Container(
                      width: 250,
                      height: 2,
                      decoration: const BoxDecoration(
                        color: AppColors.appWhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Projects",
                    style: Styles.titleStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Going to all projects page');
                    },
                    child: Text(
                      'See All',
                      style: Styles.regularStyle
                          .copyWith(color: AppColors.appDarkBlue),
                    ),
                  )
                ],
              ),
            ),
          ),
          //PROJECT CARDS
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.appWhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.appDarkBlue.withOpacity(0.6),
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: assorted[index],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.appDarkBlue.withOpacity(0.5),
                            offset: const Offset(0.2, 0.2),
                            blurRadius: 0.5,
                          )
                        ],
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          "Bsync Mobile Application",
                          style: Styles.titleStyle.copyWith(
                              fontSize: 20, color: AppColors.appWhite),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
              child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  activeDotColor: AppColors.appDarkBlue,
                  strokeWidth: 5,
                  dotWidth: 12,
                  dotHeight: 12),
            ),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: Styles.titleStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Going to all projects page');
                    },
                    child: Text(
                      'See All',
                      style: Styles.regularStyle
                          .copyWith(color: AppColors.appDarkBlue),
                    ),
                  )
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 300,
              decoration: BoxDecoration(
                  color: AppColors.appDarkBlue,
                  borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container();
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: Styles.titleStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Going to all projects page');
                    },
                    child: Text(
                      'See All',
                      style: Styles.regularStyle
                          .copyWith(color: AppColors.appDarkBlue),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
