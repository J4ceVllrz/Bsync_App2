import 'package:bsync_app2/decors/colors.dart';
import 'package:bsync_app2/decors/text_styles.dart';
import 'package:bsync_app2/pages/teams_projects.dart';
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

  List<Gradient> assortedGrad = [
    AppGradients.redOrange,
    AppGradients.violetBlue
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
          textScaler: TextScaler.noScaling,
          "Home",
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
      drawer: const MenuDrawer(),
      body: SafeArea(
          child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: Container(
              height: 70,
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                gradient: AppGradients.violetBlue,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appDarkBlue.withOpacity(0.4),
                    offset: const Offset(0.1, 0.1),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                children: [
                  const Greetings(),
                  Expanded(child: Container()),
                  // for profile picture
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.appYellow),
                  ),
                ],
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
                    textScaler: TextScaler.noScaling,
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
                      textScaler: TextScaler.noScaling,
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
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                controller: controller,
                itemCount: 5,
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
                        ),
                      ],
                    ),
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: AppGradients.redOrange,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.appWhite.withOpacity(0.5),
                              offset: const Offset(0.1, 0.1),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: size.width * 0.55,
                                decoration: BoxDecoration(
                                    color: AppColors.appWhite
                                        .withOpacity(0.7), //toberemoved
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.left,
                                      textScaler: TextScaler.noScaling,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      "Bsync Mobile Application Applicationssss",
                                      style: Styles.titleStyle.copyWith(
                                          color: AppColors.appDarkBlue),
                                    ),
                                    Gap(10),
                                    Text(
                                      textAlign: TextAlign.left,
                                      textScaler: TextScaler.noScaling,
                                      maxLines: 2,
                                      "Started: ",
                                      style: Styles.titleStyle.copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color:
                                              AppColors.appRed.withOpacity(.5)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: 100,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: AppColors.appRed,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: assorted[index % assorted.length]
                                          .withOpacity(0.5),
                                      offset: const Offset(0.1, 0.1),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverToBoxAdapter(
              child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: const WormEffect(
                  activeDotColor: AppColors.appDarkBlue,
                  strokeWidth: 5,
                  dotWidth: 6,
                  dotHeight: 6),
            ),
          )),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
              width: size.width,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: AppGradients.violetBlue,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15)),
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
                          textAlign: TextAlign.center,
                          "Create project",
                          style: Styles.regularStyle
                              .copyWith(color: AppColors.appWhite),
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => TeamsAndProjects(),
                        ));
                      },
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: AppGradients.violetBlue,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
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
                              "Create task",
                              style: Styles.regularStyle
                                  .copyWith(color: AppColors.appWhite),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textScaler: TextScaler.noScaling,
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
                      textScaler: TextScaler.noScaling,
                      'See All',
                      style: Styles.regularStyle
                          .copyWith(color: AppColors.appDarkBlue),
                    ),
                  )
                ],
              ),
            ),
          ),
          //Tasks list
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
        ],
      )),
    );
  }
}
