import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize cache
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Method to get string data (returns a default value if null)
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Method to save data with null handling
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value == null) {
      return false; // Prevent saving null values
    }

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      throw Exception("Invalid data type");
    }
  }

  //! Method to get data (returns null-safe values)
  dynamic getData({required String key}) {
    return sharedPreferences.containsKey(key)
        ? sharedPreferences.get(key)
        : null;
  }

  //! Remove data using specific key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Check if local database contains key
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! Clear all data from SharedPreferences
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //! General method to put data in SharedPreferences
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value == null) {
      throw Exception("Cannot save null value");
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      throw Exception("Invalid data type");
    }
  }
}
