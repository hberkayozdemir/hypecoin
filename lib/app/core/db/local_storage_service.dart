import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hypecoin/app/core/constants/string_constants.dart';
import 'package:hypecoin/app/core/db/app_config.dart';


class HypeLocalDataBaseService  {
  HypeLocalDataBaseService(this._flutterSecureStorage);
  final FlutterSecureStorage _flutterSecureStorage;
  late Box<dynamic> _box;
  AppConfig? _appConfigurationEntity;


  Box<dynamic> get box => _box;


  Future<void> initializeDatabase() async {
    var opened = false;
    var tries = 0;
    do {
      opened = await openBox();
      tries += 1;
    } while (tries < 2 && !opened);
  }

  Future<bool> openBox() async {
    try {
      final toggBoxKey =
      await _flutterSecureStorage.read(key: StringConstant.hypeBoxKey);
      if (toggBoxKey == null) {
        final key = Hive.generateSecureKey();
        await _flutterSecureStorage.write(
            key: StringConstant.hypeBoxKey, value: base64UrlEncode(key));
      }

      final encryptionKey = base64Url.decode(
          (await _flutterSecureStorage.read(key: StringConstant.hypeBoxKey))!);

      _box = await Hive.openBox(StringConstant.hypeBox,
          encryptionCipher: HiveAesCipher(encryptionKey));

      box
          .watch(key: StringConstant.appConfigDbKey)
          .listen(setAppConfigurationEntity);

      return true;
    } catch (e) {
      await Hive.deleteBoxFromDisk(StringConstant.hypeBoxKey);
      return false;
    }
  }


  void setAppConfigurationEntity(BoxEvent event) {
    _appConfigurationEntity = event.value as AppConfig?;
  }

}