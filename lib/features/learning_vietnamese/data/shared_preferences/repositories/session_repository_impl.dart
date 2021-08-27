import 'package:learning_vietnamese/features/learning_vietnamese/data/shared_preferences/datasources/local_data_source.dart';

class SessionRepository {
  final LocalDataSourceImpl pref = new LocalDataSourceImpl();

  //check it to show intro screen or not
  Future<bool> cacheIsNotFirstTimeUseApp() {
    return pref.addBoolToSP('is_not_first_time_use_app', true);
  }

  Future<bool> getIsNotFirstTimeUseApp() {
    return pref.getBoolValuesSP('is_not_first_time_use_app');
  }

  //cache sth relate to user

}
