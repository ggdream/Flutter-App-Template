import 'package:logger/logger.dart';

class Log {
  Log._();

  static late final Logger _logger;

  static void init() {
    _logger = Logger(
      level: Level.debug,
    );
  }

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.i(message, error, stackTrace);

  static void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.w(message, error, stackTrace);

  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.d(message, error, stackTrace);

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error, stackTrace);
}
