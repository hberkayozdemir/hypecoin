import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:hypecoin/app/features/session/bloc/session_bloc.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Example verify code')),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Enter your code',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          VerificationCode(
            textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor),
            keyboardType: TextInputType.number,
            underlineColor: Colors.amber,
            // If this is null it will use primaryColor: Colors.red from Theme
            length: 4,
            cursorColor: Colors.blue,
            // If this is null it will default to the ambient
// clearAll is NOT required, you can delete it
// takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
              ),
            ),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
              if (_code?.length != null && _code!.length == 4) {
                context.read<SessionBloc>().add(OtpEvent(context, widget.email, _code!));
              }
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: _onEditing ? Text('Please enter full code') : Text('Your code:$_code'),
            ),
          )
        ],
      ),
    );
  }
}
