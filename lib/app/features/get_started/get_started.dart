import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/buttons/rounded_button.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/localization/i10n.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/localization/provider/localization_helper.dart';
import 'package:hypecoin/routes/app_router.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    final ValueNotifier<L10n> selectedLocale = ValueNotifier(L10n.get(currentLocale));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: isDarkMode ? Colors.black : Colors.white),
        child: Padding(
          padding: EdgeInsets.all(25.r),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50.h,
            ),
            CircleAvatar(radius: 100, backgroundImage: Assets.icons.appLogo),
            SizedBox(
              height: 25.h,
            ),
            AutoSizeText(
              context.localization.welcome,
              style: ThemeStyles.primaryTitle.copyWith(color: Colors.black, fontSize: 42.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            AutoSizeText(
              context.localization.welcome_to_financial,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.sp,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 20.h,
            ),
            RoundedButton(
                onPressed: () => context.router.pushAndPopUntil(LoginRoute(), predicate: (router) => false),
                color: isDarkMode ? Colors.white : Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      context.localization.get_started,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ],
                )),
            SizedBox(
              height: 40.h,
            )
          ]),
        ),
      ),
    );
  }
}
