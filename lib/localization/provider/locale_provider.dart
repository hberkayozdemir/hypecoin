import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hypecoin/app/core/db/hive_box.dart';
import 'package:hypecoin/app/core/db/language_entity.dart';
import 'package:hypecoin/localization/i10n.dart';


/// Get and set local value
class LocaleProvider extends ChangeNotifier {
  /// Constructor
  LocaleProvider({HiveInterface? hive, Box? box}) {
    _hive = hive ?? Hive;
    _box = box;
    if (_box == null) {
      final langCode = _hive
          .box<LanguageEntity>(HiveBox.languageEntity)
          .get(HiveBox.language)
          ?.locale;
      if (langCode != null) {
        _locale = Locale(langCode);
      }
    } else {
      _locale = Locale((_box!.get(HiveBox.language) as LanguageEntity).locale);
    }
  }

  late final HiveInterface _hive;
  Box? _box;

  Locale? _locale;

  /// Getter for locale
  Locale? get locale => _locale;

  /// Setter for locale
  void setLocale(Locale locale) {
    /// Check if paramenterize locale is exist in our supported language list
    /// or not
    if (!L10n.all.contains(locale)) return;

    _locale = locale;

    /// Store local to database for persistance
    if (_box == null) {
      _hive
          .box<LanguageEntity>(HiveBox.languageEntity)
          .put(HiveBox.language, LanguageEntity(locale: _locale!.languageCode));
    }

    notifyListeners();
  }

  /// Clear the locale
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
