import 'dart:async';

import 'package:devops/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._internal() {
    _perf = SharedPreferences.getInstance();
  }

  factory SharedPrefs() => _instance;

  static final SharedPrefs _instance = SharedPrefs._internal();
  static late final Future<SharedPreferences> _perf;

  Future<String?> getLicense() =>
      _perf.then((ins) => ins.getString(KeyLicense));

  Future<bool> setLicense(String value) {
    return _perf.then((ins) => ins.setString(KeyLicense, value));
  }
}

final sharedStorage = SharedPrefs();
