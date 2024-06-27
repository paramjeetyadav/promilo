import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  /// Initialization of shared preference
  static Future<SharedPreferences> get _sharedInstance async => _sharedPrefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _sharedPrefsInstance;
  static SharedPreferences? get sharedInstance => _sharedPrefsInstance;

  /// Initialization of flutter secured storage
  static const FlutterSecureStorage _instance = FlutterSecureStorage(
    webOptions: WebOptions(dbName: 'Undp'),
  );
  static FlutterSecureStorage get instance => _instance;

  /// call this method from iniState() function of mainApp().
  /// static Future<SharedPreferences> init() async {
  static Future<FlutterSecureStorage> init() async {
    _sharedPrefsInstance ??= await _sharedInstance;
    return _instance;
  }

  /// get value from flutter secure storage
  static dynamic getSecuredValue(String key, {dynamic defValue, bool isInt = false, bool isBool = false}) async {
    String? value = await _instance.read(key: key);
    if (isBool) return value == 'true';
    if (isInt) return int.tryParse(value ?? '') ?? defValue ?? 0;
    return value ?? defValue ?? '';
  }

  /// get value from sharedPref
  static String getSharedPrefValue(String key, {String? defaultValue}) {
    return _sharedPrefsInstance?.getString(key) ?? defaultValue ?? '';
  }

  /// set value in flutter secure storage
  static Future<void> setSecuredValue(String key, dynamic value, {bool isInt = false, bool isBool = false}) async {
    return await _instance.write(key: key, value: value?.toString());
  }

  /// set value in sharedPref
  static Future<bool> setSharedPrefValue(String key, dynamic value) async {
    return (await _sharedPrefsInstance?.setString(key, value)) ?? false;
  }

  /// Clear single Key from secure storage
  static Future<void> clearSecuredByKey(String key) async {
    await _instance.delete(key: key);
  }

  /// Clear single Key from shared storage
  static void clearSharedKeyValue(String key) async {
    await _sharedPrefsInstance?.remove(key);
  }

  /// Clear all secure storage
  static Future<void> clearSecured() async {
    return await _instance.deleteAll();
  }

  /// Clear all secure storage
  static Future<bool> clearShared() async {
    return await _sharedPrefsInstance?.clear() ?? false;
  }
}
