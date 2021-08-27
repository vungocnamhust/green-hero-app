import 'package:learning_vietnamese/core/Constant/API_CONST.dart';

import 'main.dart';

void main() {
  // APIConst.setBaseUrl(Environment.PRODUCTION);
  APIConst.setBaseUrl(Environment.HEROKU);
  mainGreenHero();
}