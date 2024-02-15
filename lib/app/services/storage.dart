import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static bool getHasOnboarded() {
    return _prefsInstance!.getBool('hasOnboarded') ?? false;
  }

  static Future<bool> sethasOnboarded() async {
    var prefs = await _instance;
    return prefs.setBool('hasOnboarded', true);
  }
}
