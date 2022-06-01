import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hypecoin/localization/localization_delegate.dart';


class HypeAppLocalization {
  static AppLocalizations get instance => HypeAppLocalizationsDelegate.instance;

}


extension Localization on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
