import 'package:learning_vietnamese/core/util/env_config.dart';

class APIConst {
  // static const String baseUrl = 'http://10.0.2.2:3000/api/v1';
  // static const String baseUrl = 'http://viet-study.herokuapp.com/api/v1';

  static String get baseUrl => _baseUrl;

  static String _baseUrl;

  static void setBaseUrl(Environment env) {
    switch(env) {
      case Environment.LOCAL:
        _baseUrl = EnvConfig.baseUrlLocal;
        break;
      case Environment.HEROKU:
        _baseUrl = EnvConfig.baseUrlHeroku;
        break;
      case Environment.PRODUCTION:
        _baseUrl = EnvConfig.baseUrlProduction;
        break;
    }
  }

  static const String networkIMediaPrefix = '/media';
  static const int userId = 2;
}

enum Environment {LOCAL, HEROKU, PRODUCTION}