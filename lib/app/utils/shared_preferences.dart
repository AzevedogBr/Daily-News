import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final Future<SharedPreferences> _prefs;

  SharedService(this._prefs);

  Future<void> setFavorite(String value) async {
    try {
      final pref = await _prefs;
      if (pref.containsKey('listFavorites')) {
        await pref?.clear();
      }

      pref?.setString('listFavorites', value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getFavorite() async {
    print(hashCode);
    try {
      final prefs = await _prefs;
      String list = prefs.getString('listFavorites');
      return list;
    }
    catch (e) {
      rethrow;
    }
  }

  Future<void> clean() async {
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
