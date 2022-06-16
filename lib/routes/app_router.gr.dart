// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    GetStartedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GetStartedScreen());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: RegisterScreen());
    },
    VerificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const VerificationScreen());
    },
    LandingMainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LandingMainScreen());
    },
    FavlistTab.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FavListScreen());
    },
    NewsTab.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewsScreen());
    },
    HomeTab.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePageScreen());
    },
    TradesTab.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TradesScreen());
    },
    TreasuryTab.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TreasuryScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'getStarted', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'intro'),
        RouteConfig(GetStartedRoute.name, path: 'getStarted'),
        RouteConfig(LoginRoute.name, path: 'login'),
        RouteConfig(RegisterRoute.name, path: 'register'),
        RouteConfig(VerificationRoute.name, path: 'verification'),
        RouteConfig(LandingMainRoute.name, path: 'landing', children: [
          RouteConfig(FavlistTab.name,
              path: 'favlist', parent: LandingMainRoute.name),
          RouteConfig(NewsTab.name,
              path: 'news', parent: LandingMainRoute.name),
          RouteConfig(HomeTab.name,
              path: 'home', parent: LandingMainRoute.name),
          RouteConfig(TradesTab.name,
              path: 'trades', parent: LandingMainRoute.name),
          RouteConfig(TreasuryTab.name,
              path: 'treasury', parent: LandingMainRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'intro');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [GetStartedScreen]
class GetStartedRoute extends PageRouteInfo<void> {
  const GetStartedRoute() : super(GetStartedRoute.name, path: 'getStarted');

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute()
      : super(VerificationRoute.name, path: 'verification');

  static const String name = 'VerificationRoute';
}

/// generated route for
/// [LandingMainScreen]
class LandingMainRoute extends PageRouteInfo<void> {
  const LandingMainRoute({List<PageRouteInfo>? children})
      : super(LandingMainRoute.name,
            path: 'landing', initialChildren: children);

  static const String name = 'LandingMainRoute';
}

/// generated route for
/// [FavListScreen]
class FavlistTab extends PageRouteInfo<void> {
  const FavlistTab() : super(FavlistTab.name, path: 'favlist');

  static const String name = 'FavlistTab';
}

/// generated route for
/// [NewsScreen]
class NewsTab extends PageRouteInfo<void> {
  const NewsTab() : super(NewsTab.name, path: 'news');

  static const String name = 'NewsTab';
}

/// generated route for
/// [HomePageScreen]
class HomeTab extends PageRouteInfo<void> {
  const HomeTab() : super(HomeTab.name, path: 'home');

  static const String name = 'HomeTab';
}

/// generated route for
/// [TradesScreen]
class TradesTab extends PageRouteInfo<void> {
  const TradesTab() : super(TradesTab.name, path: 'trades');

  static const String name = 'TradesTab';
}

/// generated route for
/// [TreasuryScreen]
class TreasuryTab extends PageRouteInfo<void> {
  const TreasuryTab() : super(TreasuryTab.name, path: 'treasury');

  static const String name = 'TreasuryTab';
}
