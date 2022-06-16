import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hypecoin/app/core/features/principal/presentation/view/landing_main.dart';
import 'package:hypecoin/app/core/features/splash_screen/view/splash_screen.dart';
import 'package:hypecoin/app/features/favlist/presentation/view/fav_list_screen.dart';
import 'package:hypecoin/app/features/get_started/get_started.dart';
import 'package:hypecoin/app/features/home_page/view/home_page_screen.dart';
import 'package:hypecoin/app/features/news/view/news_screen.dart';

import 'package:hypecoin/app/features/session/login/view/login_screen.dart';
import 'package:hypecoin/app/features/session/register/register_screen.dart';
import 'package:hypecoin/app/features/trades/view/trades_screen.dart';
import 'package:hypecoin/app/features/treasury/view/treasury_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, path: 'intro'),
  AutoRoute(initial: true,page: GetStartedScreen, path: 'getStarted'),
  AutoRoute(page: LoginScreen, path: 'login'),
  AutoRoute(page: RegisterScreen, path: 'register'),
  AutoRoute( page: LandingMainScreen, path: 'landing', children: [
    AutoRoute(page: FavListScreen, name: 'FavlistTab', path: 'favlist'),
    AutoRoute(page: NewsScreen, name: 'NewsTab', path: 'news'),
    AutoRoute(page: HomePageScreen, name: 'HomeTab', path: 'home'),
    AutoRoute(page: TradesScreen, name: 'TradesTab', path: 'trades'),
    AutoRoute(page: TreasuryScreen, name: 'TreasuryTab', path: 'treasury'),
  ]),
])
class AppRouter extends _$AppRouter {}
