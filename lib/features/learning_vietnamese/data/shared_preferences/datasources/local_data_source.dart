import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> addBoolToSP(String name, bool value);
  Future<bool> addStringToSP(String name, String value);
  Future<String> getStringValuesSP(String name);
  Future<bool> getBoolValuesSP(String name);
}

class LocalDataSourceImpl {
  Future<bool> addBoolToSP(String name, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(name, value);
  }

  Future<bool> addStringToSP(String name, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(name, value);
  }

  Future<String> getStringValuesSP(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(name) ?? DateTime.now().toString();
    return stringValue;
  }

  Future<bool> getBoolValuesSP(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(name) ?? false;
    return boolValue;
  }
}
