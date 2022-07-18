import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static   SharedPreferences sharedPreferences;
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> putBoolen({ String key , bool value}) async
  {
   return await sharedPreferences.setBool(key, value);
  }
  static bool getBoolen({  String key })
  {
    return  sharedPreferences.getBool(key);
  }
}

