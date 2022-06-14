import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_managers/flutter_managers.dart';

class ClientService {
  static final ClientService _instance = ClientService._();
  static ClientService get instance => _instance;
  late ClientManager manager;
  ClientService._() {
    manager = ClientManager(
        options: BaseOptions(),
        onRefreshToken: (error, manager) async {
          // final refreshToken = await manager.getRequest<Credantial, Credantial>(
          //   "/token",
          //   parseModel: Credantial(),
          // );
          // error.request.headers = {HttpHeaders.authorizationHeader: "Bearer ${refreshToken.data.token}"};

          return error;
        });
  }
}