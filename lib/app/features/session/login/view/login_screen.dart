import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/buttons/rounded_button.dart';

import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/session/login/theme_helper.dart';
import 'package:hypecoin/app/features/session/login/widget/header_widget.dart';
import 'package:hypecoin/localization/localization.dart';

import 'package:hypecoin/routes/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
          height: _headerHeight,
          child: HeaderWidget(_headerHeight, true,
            AutoSizeText(
              "HIBEMI",
              style: TextStyle(color: Colors.white,
                  fontSize: 34.sp,fontWeight: FontWeight.w700),), //let's create a common header widget
          ),),
          SafeArea(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                // This will be the login form
                child: Column(
                  children: [
                    AutoSizeText(
                      context.localization.welcome,
                      style: TextStyle(fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      context.localization.sign_in,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration(
                                    context.localization.email, 'Enter your user name'),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                    context.localization.password, 'Enter your password'),
                              ),
                              decoration: ThemeHelper()
                                  .inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),


                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Don\'t have an account? ",style: TextStyle(color: Colors.black)),
                                        TextSpan(
                                          text: context.localization.sign_up,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.router.push(
                                                  RegisterRoute());
                                            },
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ]
                                  )
                              ),
                            ),
                            RoundedButton(
                              onPressed: (){},
                              child: Center(
                                child: Text( context.localization.sign_in,),
                              ),
                              color: Colors.pink,
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
          ),
          ],
        ),
      ),
    );
  }
}
