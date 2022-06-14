import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LandingMain extends StatelessWidget {
  const LandingMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber ,
body: AutoTabsScaffold(routes: [

],

homeIndex: 0,
),
    );
  }
}
