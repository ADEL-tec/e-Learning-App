import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/user.dart';
import '../values/constants.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool get getDeviceFirstOpen {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_OPEN) ?? false;
  }

  bool get getIsLoggedIn {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  UserItem? get getUserProfile {
    final profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return null;
  }

  String get getUserToken {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
