// ignore_for_file: avoid_dynamic_calls

import 'package:hypecoin/localization/localization.dart';
import 'package:dio/src/dio_error.dart';

class ExceptionHandler {
  const ExceptionHandler._();

  static String getErrorMessage(dynamic exception) {
    try {
      if (exception is DioError &&
          exception.response?.data is Map<String, dynamic>) {
        return exception.response!.data['reason'] as String;
      }
      throw NullThrownError();
    } catch (e) {
      return HypeAppLocalization.instance.system_error_occurred;
    }
  }
}
