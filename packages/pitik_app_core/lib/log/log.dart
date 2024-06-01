// Package imports:
// ignore_for_file: public_member_api_docs

import 'package:logger/logger.dart';
import 'package:pitik_app_core/log/filter/log_filter.dart';
import 'package:pitik_app_core/log/printer/log_printer.dart';

enum LogType {
  verbose,
  debug,
  info,
  warning,
  error,
  fatal,
}

class Log {
  Log();
  final Logger _logger =Logger(
        filter: ReleaseLogFilter(),
        printer: PrefixPrinter(
          SimpleLogPrinter(),
          error: 'Error -',
          debug: 'Log -',
          fatal: 'FatalError -',
          info: 'Info -',
          trace: 'Trace -',
          warning: 'Warning -',
        ));

  Future<void> console(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    LogType type = LogType.debug,
  }) async {
    switch (type) {
      case LogType.verbose:
        _logger.t(message, error: error, stackTrace: stackTrace);
      case LogType.debug:
        _logger.d(message, error: error, stackTrace: stackTrace);
      case LogType.info:
        _logger.i(message, error: error, stackTrace: stackTrace);
      case LogType.warning:
        _logger.w(message, error: error, stackTrace: stackTrace);
      case LogType.error:
        _logger.e(message, error: error, stackTrace: stackTrace);
      case LogType.fatal:
        _logger.f(message, error: error, stackTrace: stackTrace);
    }
  }
}
