// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/models/user_model.dart';

void main() {
  test('Client Manager Test', () async {
    final manager = ClientManager(

      options: BaseOptions(baseUrl: 'http://127.0.0.1:8080'),

    );
    final response = await manager.postRequest<User, User>(
      '/login',
      body:{

        "email": "hilmiberkayozdemir@gmail.com",
        "password":"Hbo.1998"
      }
      ,
      parseModel: User(),
    );
    debugPrint(response.data?.exp.toString());
  });
}

class Connection extends ClientModel<Connection> {
  Connection({
    this.success,
  });

  bool? success;

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
      };

  @override
  Connection fromJson(Map<String, dynamic> json) => Connection.fromJson(json);
}
