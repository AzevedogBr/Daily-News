import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final Future<SharedPreferences> _prefs;

  SharedService(this._prefs);

  Future<String> getLogin(String key) async {
    try {
      final prefs = await _prefs;
      var login = prefs.getString(key);
      return login;
    }
    catch (e) {
      rethrow;
    }
  }


  save(String key, value) async {
    final pref = await _prefs;
    pref.setString(key, json.encode(value));
  }

  read(String key) async {
    final prefs = await _prefs;
    return json.decode(prefs.getString(key));
  }


  remove(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);
  }

  Future<void> cleanAll() async {
    try {
      final prefs = await _prefs;
      await prefs.clear();
      return null;
    }
    catch (e) {
      rethrow;
    }
  }
}
