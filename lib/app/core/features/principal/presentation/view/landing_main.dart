import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/core/features/drawer/custom_drawer.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/routes/app_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LandingMainScreen extends StatelessWidget {
  const LandingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: AutoTabsScaffold(
          drawer: CustomDrawer(
            userType: "admin",
          ),
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: isDarkMode ? Colors.black : Colors.grey.shade100,
          routes: [
            FavlistTab(),
            TradesTab(),
            NewsTab(),
            HomeTab(),
            TreasuryTab()
          ],
          homeIndex: 0,
          bottomNavigationBuilder: (context, tabsRouter) => DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    border:
                        Border.all(color: Colors.purple.shade900, width: 0.5)),
                child: SalomonBottomBar(
                    unselectedItemColor: Colors.white,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (index) => tabsRouter.setActiveIndex(index),
                    items: [
                      SalomonBottomBarItem(
                          title: Text("FavList"),
                          selectedColor: Colors.purple,
                          icon: Icon(
                            Icons.star_border_purple500,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: Colors.purple,
                          title: Text("Trades"),
                          icon: Icon(
                            Icons.trending_up,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: Colors.purple,
                          title: Text("News"),
                          icon: Icon(
                            Icons.newspaper_sharp,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: Colors.purple,
                          title: Text("Home"),
                          icon: Icon(
                            Icons.home,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: Colors.purple,
                          title: Text("Treasury"),
                          icon: Icon(
                            Icons.pie_chart,
                          )),
                    ]),
              )),
    );
  }
}
