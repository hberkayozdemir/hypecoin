import 'package:package_info/package_info.dart';

class HypeApp {
  const HypeApp._();

  static late PackageInfo packageInfo;
  static late String platformName;

  static String get versionInfo =>
      '${HypeApp.packageInfo.version}+${HypeApp.packageInfo.buildNumber}';

  static bool get isDevelopment =>
      packageInfo.packageName == 'com.hypecoin.hypecoinmobile';

  static bool get isProduction =>
      packageInfo.packageName == 'com.hypecoin.hypecoinmobile.prod';
  static Environment get activeEnvironment =>
      isProduction ? Environment.prod : Environment.staging;

}

enum Environment { test, dev, prod,staging }
