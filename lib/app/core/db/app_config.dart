import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hypecoin/app/core/utils/hype_app.dart';

part 'app_config.g.dart';

@HiveType(typeId: 0)
class AppConfig extends HiveObject {
  AppConfig(
      {this.clientId,
      this.redirectUrl,
      this.authLink,
      this.tokenLink,
      this.tenantId,
      this.hypeCoinEndPoint,
      this.registrationLink,
      this.isTesting = false});

  @HiveField(0)
  String? clientId;

  @HiveField(1)
  String? redirectUrl;

  @HiveField(2)
  String? authLink;

  @HiveField(3)
  String? tokenLink;

  @HiveField(4)
  String? tenantId;

  @HiveField(5)
  String? hypeCoinEndPoint;

  @HiveField(6)
  String? registrationLink;

  bool isTesting;

  void saveFromAppConfig(AppConfig appConfig) {
    clientId = appConfig.clientId;
    redirectUrl = appConfig.redirectUrl;
    authLink = appConfig.authLink;
    registrationLink = appConfig.registrationLink;
    tokenLink = appConfig.tokenLink;
    tenantId = appConfig.tenantId;
    if (!isTesting) save();
  }

  static Future<AppConfig> defaultConfig() async {
    final filePath = HypeApp.activeEnvironment.name;
    await dotenv.load(fileName: 'assets/environment/$filePath.env');
    return AppConfig(
      clientId: dotenv.get('clientId'),
      redirectUrl: dotenv.get('redirectUrl'),
      authLink: dotenv.get('authLink'),
      registrationLink: dotenv.get('registrationLink'),
      tokenLink: dotenv.get('tokenLink'),
      tenantId: dotenv.get('tenantId'),
    );
  }
}
