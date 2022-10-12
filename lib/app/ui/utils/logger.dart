// ignore_for_file: avoid_print

class Logger {
  static final Logger _instance = Logger._internal();

  Logger._internal();
  static Logger get i => _instance;

  void success(String text) {
    print('\x1B[32m===================================================\x1B[0m');
    print('\u001b[42m\u001b[30m*** MESSAGE SUCCESS - EDWARD GOMEZ ***\x1B[0m');
    print("\n");
    print('\x1B[32m*** $text ***\x1B[0m');
    print('\x1B[32m===================================================\x1B[0m');
  }

  void info(String text) {
    print('\x1B[34m===================================================\x1B[0m');
    print('\u001b[44m\u001b[30m*** MESSAGE INFO - EDWARD GOMEZ ***\x1B[0m');
    print("\n");
    print('\x1B[34m*** $text ***\x1B[0m');
    print('\x1B[34m===================================================\x1B[0m');
  }

  void warning(String text) {
    print('\x1B[33m===================================================\x1B[0m');
    print('\u001b[43m\u001b[30m*** MESSAGE WARNING - EDWARD GOMEZ ***\x1B[0m');
    print("\n");
    print('\x1B[33m*** $text ***\x1B[0m');
    print('\x1B[33m===================================================\x1B[0m');
  }

  void error(String text) {
    print('\x1B[31m===================================================\x1B[0m');
    print('\u001b[41m\u001b[30m*** MESSAGE ERROR - EDWARD GOMEZ ***\x1B[0m');
    print("\n");
    print('\x1B[31m*** $text ***\x1B[0m');
    print('\x1B[31m===================================================\x1B[0m');
  }
}
