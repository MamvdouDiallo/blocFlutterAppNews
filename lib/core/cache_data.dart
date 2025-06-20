
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedData{
  static SharedPreferences? _sharedPreferences;
  static int() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic saveStringData({required String key, required String value}) async{
    await _sharedPreferences!.setString(key, value);
  }

  static dynamic saveBoolData({required String key, required bool value}) async{
    await _sharedPreferences!.setBool(key, value);
  }

  static Future<bool> saveData(
  {required String key , required dynamic value}
      ) async{
    if(value is String) return await _sharedPreferences!.setString(key, value);
   // if(value is int) return await _sharedPreferences!.setInt(key, value);
    if(value is double) return await _sharedPreferences!.setDouble(key, value);
    if(value is bool) return await _sharedPreferences!.setBool(key, value);
    return await _sharedPreferences!.setStringList(key, value);
  }
  static dynamic getData({required String key}){
    return _sharedPreferences!.get(key);
  }
}