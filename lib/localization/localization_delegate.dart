import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HypeAppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {

  const HypeAppLocalizationsDelegate();

  static late AppLocalizations instance;

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.delegate.isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final _instance = await AppLocalizations.delegate.load(locale);
    HypeAppLocalizationsDelegate.instance = _instance;
    return instance;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

