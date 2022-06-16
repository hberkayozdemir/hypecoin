import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/appbar/hibemi_appbar.dart';
import 'package:hypecoin/app/core/features/banner/view/banner.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/treasury/models/treasury_model.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/otherDetailsDivider.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/transactionCard.dart';
import 'package:hypecoin/localization/localization.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
        appBar: HibemiAppBar(
          titleImage: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.appLogo.image(),
              Assets.images.drawerbanner.image(
                height: 80.h,
                width: 200.w,
              ),
            ],
          ),
          hasBackButton: false,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            BannerWidget(),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(context.localization.new_trends, style: ThemeStyles.primaryTitle),
                  TransactionCard(
                    data: TreasuryModel(),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
