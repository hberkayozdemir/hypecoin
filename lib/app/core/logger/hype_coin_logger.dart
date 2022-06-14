import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/logger/hype_logger.dart';
import 'package:logger/logger.dart';


class HypeAppLogger extends HypeLogger {
  HypeAppLogger._();

  static final log = HypeAppLogger._();

  final _log = Logger(
    printer: PrettyPrinter(
      colors: true,
      printTime: true,
    ),
  );

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    _log.d(message, error, stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    _log.e(message, error, stackTrace);
    if (!kDebugMode) {
      FirebaseCrashlytics.instance
          .recordError(error, stackTrace, information: message);
    }
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    _log.i(message, error, stackTrace);
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    _log.v(message, error, stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    _log.w(message, error, stackTrace);
  }
}
