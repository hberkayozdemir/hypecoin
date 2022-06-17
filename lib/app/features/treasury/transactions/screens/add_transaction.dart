import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/features/buttons/rounded_button.dart';
import 'package:hypecoin/app/features/editor/bloc/editor_bloc.dart';
import 'package:hypecoin/app/features/session/bloc/session_bloc.dart';
import 'package:hypecoin/app/features/session/login/theme_helper.dart';
import 'package:hypecoin/app/features/session/login/widget/header_widget.dart';
import 'package:hypecoin/app/features/treasury/bloc/treasury_bloc.dart';
import 'package:hypecoin/localization/localization.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTransactionScreenState();
  }
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final TextEditingController _symbol = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _buyingprice = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
                      "Editor Add News Screen",
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
                              enableInteractiveSelection:true,
                              controller: _symbol,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blue),
                              decoration: ThemeHelper().textInputDecoration(
                                  "Symbol",
                                  'Enter image url'),
                            ),
                            decoration:
                            ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          Container(
                            child: TextFormField(
                              controller: _content,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blue),
                              decoration: ThemeHelper().textInputDecoration(
                                  "Content",
                                  'Enter your last name'),
                            ),
                            decoration:
                            ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: _title,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blue),
                              decoration: ThemeHelper().textInputDecoration(
                                  "title",
                                  "Enter news title"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(height: 20.0),

                          SizedBox(height: 20.0),
                          Container(

                            child: TextFormField(
                              controller: _amount,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blue),
                              decoration: ThemeHelper().textInputDecoration(
                                  "Amount", "Enter news content"),
                              keyboardType: TextInputType.streetAddress,

                            ),
                            decoration:
                            ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(

                            child: TextFormField(
                              controller: _buyingprice,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blue),
                              decoration: ThemeHelper().textInputDecoration(
                                  "Buying price", "Enter news content"),
                              keyboardType: TextInputType.streetAddress,

                            ),
                            decoration:
                            ThemeHelper().inputBoxDecorationShaddow(),
                          ),

                          RoundedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true)
                                context.read<TreasuryBloc>()..add(
                                  PostTreasuryEvent(
                                    context,
                                    amount: _amount.text as double ,
                                    symbol: _symbol.text,
                                    transaction_type: "sell",
                                    buying_price: _buyingprice.text as double,
                                    


                                  ),
                                );
                            },
                            child: Center(
                              child: Text(
                                  "Buy"
                              ),
                            ),
                            color: Colors.redAccent.shade700,

                          ),
                          SizedBox(height: 20.0),

                          SizedBox(height: 15.0),
                          RoundedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true)
                                context.read<TreasuryBloc>()..add(
                                  PostTreasuryEvent(
                                    context,
                                    amount: _symbol.text as double ,
                                    symbol: _symbol.text,
                                    transaction_type: "buy",
                                    buying_price: _title.text as double,


                                  ),
                                );
                            },
                            child: Center(
                              child: Text(
                                "Buy" 
                              ),
                            ),
                            color: Colors.greenAccent.shade700,
                            
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
