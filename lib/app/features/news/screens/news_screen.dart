import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/appbar/hibemi_appbar.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/news/Widgets/news_body.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
        backgroundColor: Colors.transparent,
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
        body: NewsBodyScreen());
  }
}
