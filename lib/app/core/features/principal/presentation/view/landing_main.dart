import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/core/features/drawer/custom_drawer.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/routes/app_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LandingMainScreen extends StatelessWidget {
  const LandingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isDarkMode=Theme.of(context).brightness==Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xff0F100D) : Colors.white,
      body: AutoTabsScaffold(
          drawer: CustomDrawer(
            userType: "admin",
          ),
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
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
                  border: Border(top:  BorderSide(width: 0.3,color: Colors.grey),),
                    color: isDarkMode?Color(0xff000000):Colors.white,
                 ),
                child: SalomonBottomBar(
                    unselectedItemColor: isDarkMode?Colors.white: Colors.black,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (index) => tabsRouter.setActiveIndex(index),
                    items: [
                      SalomonBottomBarItem(
                          title: Text(context.localization.favorites),
                          selectedColor: isDarkMode?Colors.pink: Colors.purple ,
                          icon: Icon(
                            Icons.star_border_purple500,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: isDarkMode?Colors.pink:  Colors.purple,
                          title: Text(context.localization.spots),
                          icon: Icon(
                            Icons.trending_up,
                          )),
                      SalomonBottomBarItem(
                          selectedColor:  isDarkMode?Colors.pink: Colors.purple,
                          title: Text(context.localization.news),
                          icon: Icon(
                            Icons.newspaper_sharp,
                          )),
                      SalomonBottomBarItem(
                          selectedColor: isDarkMode?Colors.pink:  Colors.purple,
                          title: Text(context.localization.home),
                          icon: Icon(
                            Icons.home,
                          )),
                      SalomonBottomBarItem(
                          selectedColor:  isDarkMode?Colors.pink: Colors.purple,
                          title: Text(context.localization.treasury),
                          icon: Icon(
                            Icons.pie_chart,
                          )),
                    ]),
              )),
    );
  }
}
