import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: Assets.icons.appLogo
          )
        )
    )

    ;
  }
}
