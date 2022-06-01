import 'package:intl/intl.dart';

extension CurrencyFormat on double {
  String format(String localeName) {
    final currencyFormat = NumberFormat('#,##0.00', localeName);
    return currencyFormat.format(this);
  }
}
