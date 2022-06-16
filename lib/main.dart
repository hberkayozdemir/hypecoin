import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/core/features/splash_screen/view/splash_screen.dart';
import 'package:hypecoin/app_bloc_observer.dart';

import 'package:hypecoin/localization/bloc/localization_bloc.dart';
import 'package:hypecoin/localization/i10n.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/localization/localization_delegate.dart';

import 'package:hypecoin/localization/provider/localization_helper.dart';
import 'package:hypecoin/routes/app_router.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  final LocalizationHelper localization = LocalizationHelper();
  BlocOverrides.runZoned(
        () =>
        runApp(MultiBlocProvider(providers: [
          BlocProvider(create: (context) => ThemeCubit()),

          BlocProvider(create: (context) =>
              LocalizationsBloc(localizationHelper: LocalizationHelper(),))
        ], child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return BlocBuilder<LocalizationsBloc, LocalizationsState>(
              builder: (context, state) {
                return ScreenUtilInit(
                  designSize: const Size(375, 812),
                  builder: (_, child) =>
                      MaterialApp.router(
                        theme:ThemeData(
                          brightness: context.read<ThemeCubit>().isDarkMode?Brightness.dark:Brightness.light,
                        ),
                        debugShowCheckedModeBanner: false,
                        builder: (BuildContext context, Widget? child) {
                          final data = MediaQuery.of(context);
                          return MediaQuery(
                            data: data.copyWith(
                              textScaleFactor: data.textScaleFactor.clamp(1.0,
                                  1.15),
                            ),
                            child: child!,

                          );
                        },


                        localizationsDelegates: const [
                          HypeAppLocalizationsDelegate(),
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        locale: state.locale,
                        supportedLocales: L10n.all,
                        routerDelegate: appRouter.delegate(),
                        routeInformationParser: appRouter.defaultRouteParser(),
                        useInheritedMediaQuery: true,
                      ),
                );
              },
            );
          },
        ))),
    blocObserver: AppBlocObserver(),
  );
}



