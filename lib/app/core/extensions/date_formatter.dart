import 'package:intl/intl.dart';

DateFormat _dateFormatyyyyMMddDot = DateFormat('yyyy.MM.dd');

extension DateTimeExtension on DateTime {
  String toFormatyyyyMMddDot() => _dateFormatyyyyMMddDot.format(this);
}
