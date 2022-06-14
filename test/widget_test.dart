// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:flutter_managers/flutter_managers.dart';

void main() {
  testWidgets('Client Manager Test', (WidgetTester tester) async {
    final manager = ClientService.instance.manager;
    final response = await manager.postRequest<Token, Token>(
      '/token',
      parseModel: Token(),
    );
  });
}

class Token extends ClientModel<Token> {
  Token({
    this.token,
  });
  String? token;

  @override
  Token fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
      );

  @override
  Map<String, dynamic>? toJson() => {
        "token": token,
      };
}
