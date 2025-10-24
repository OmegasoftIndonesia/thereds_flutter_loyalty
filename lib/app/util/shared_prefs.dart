import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static PreferencesUtil? manager;
  static SharedPreferences? sharedPreferences;
  static const String userId = "userId";
  static const String kodePelanggan = "cif";
  static const String fotoProfil = "fotoProfil";
  static const String email = "email";
  static const String phone = "phone";
  static const String name = "name";
  static const String serverKeyGopay= "serverKeyGopay";
  static const String tglLahir = "tglLahir";
  static const String whatsApp = "whatsApp";
  static const String deviceUUID = "deviceUUID";
  static const String fotoKTP = "fotoKTP";
  static const String fotoOrangKTP = "fotoOrangKTP";
  static const String kota = "kota";
  static const String ppn = "ppn";
  static Future<PreferencesUtil?> getInstance() async {
    manager ??= PreferencesUtil();
    sharedPreferences ??= await SharedPreferences.getInstance();

    return manager;
  }

  Future<bool> putBool(String key, bool value) =>
      sharedPreferences!.setBool(key, value);

  bool? getBool(String key) => sharedPreferences!.getBool(key);

  Future<bool> putDouble(String key, double value) =>
      sharedPreferences!.setDouble(key, value);

  double? getDouble(String key) => sharedPreferences!.getDouble(key);

  Future<bool> putInt(String key, int value) =>
      sharedPreferences!.setInt(key, value);

  int? getInt(String key) => sharedPreferences!.getInt(key);

  Future<bool> putString(String key, String value) =>
      sharedPreferences!.setString(key, value);

  String? getString(String key) => sharedPreferences!.getString(key);

  Future<bool> putStringList(String key, List<String> value) =>
      sharedPreferences!.setStringList(key, value);

  List<String>? getStringList(String key) =>
      sharedPreferences!.getStringList(key);

  bool? isKeyExists(String key) => sharedPreferences!.containsKey(key);

  Future<bool> clearKey(String key) => sharedPreferences!.remove(key);

  Future<bool> clearAll() => sharedPreferences!.clear();

  void removeKey(String key){
    sharedPreferences!.remove(key);
  }

  static void clearLogin() {
    sharedPreferences!.remove(PreferencesUtil.userId);
    sharedPreferences!.remove(PreferencesUtil.kodePelanggan);
    sharedPreferences!.remove(PreferencesUtil.email);
    sharedPreferences!.remove(PreferencesUtil.phone);
    sharedPreferences!.remove(PreferencesUtil.name);
    sharedPreferences!.remove(PreferencesUtil.deviceUUID);
    sharedPreferences!.remove(PreferencesUtil.tglLahir);
    sharedPreferences!.remove(PreferencesUtil.whatsApp);
    sharedPreferences!.remove(PreferencesUtil.fotoKTP);
    sharedPreferences!.remove(PreferencesUtil.fotoOrangKTP);
    sharedPreferences!.remove(PreferencesUtil.kota);
    sharedPreferences!.remove(PreferencesUtil.ppn);
    sharedPreferences!.remove(PreferencesUtil.serverKeyGopay);
  }
}
