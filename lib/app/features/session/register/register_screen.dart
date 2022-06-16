import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/features/buttons/rounded_button.dart';
import 'package:hypecoin/app/features/session/bloc/session_bloc.dart';
import 'package:hypecoin/app/features/session/login/theme_helper.dart';
import 'package:hypecoin/app/features/session/login/widget/header_widget.dart';
import 'package:hypecoin/localization/localization.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _firstNameCont = TextEditingController();
  final TextEditingController _lastNameCont = TextEditingController();
  final TextEditingController _passwordCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(
                  150,
                  true,
                  AutoSizeText(
                    "HIBEMI",
                    style: TextStyle(color: Colors.white, fontSize: 32.sp),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _firstNameCont,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                            decoration: ThemeHelper().textInputDecoration(context.localization.name, 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            controller: _lastNameCont,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                            decoration: ThemeHelper().textInputDecoration(context.localization.surname, 'Enter your last name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _emailCont,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                            decoration: ThemeHelper().textInputDecoration(context.localization.email, "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _phoneCont,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                            decoration: ThemeHelper().textInputDecoration("Phone", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordCont,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                            decoration: ThemeHelper().textInputDecoration("${context.localization.password}", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        RoundedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true)
                              context.read<SessionBloc>().add(
                                    RegisterEvent(
                                      context,
                                      firstName: _firstNameCont.text,
                                      lastName: _lastNameCont.text,
                                      phone: _phoneCont.text,
                                      email: _emailCont.text,
                                      password: _passwordCont.text,
                                    ),
                                  );
                          },
                          child: Center(
                            child: Text(
                              context.localization.sign_up,
                            ),
                          ),
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
