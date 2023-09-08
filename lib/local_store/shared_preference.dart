import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static SharedPreferences? _pref;

  Future<SharedPreferences?> instance() async {
    if (_pref != null) return _pref;
    await SharedPreferences.getInstance().then((onValue) {
      _pref = onValue;
    }).catchError((onError) {
      _pref = null;
    });
    return _pref;
  }

  static const String _isUserLoggedIn = "isUserLoggedIn";
  static const String _userName = "userName";
  static const String _name = "name";
  static const String _userEmail = "userEmail";
  static const String _accessToken = "accessToken";
  static const String _userId = "userId";
  static const String _userChatUrl = "userChatUrl";

  static setUserName(String value) async {
    _pref?.setString(_userName, value);
  }

  String getUserName() {
    return _pref?.getString(_userName) ?? "";
  }

  static setName(String value) async {
    _pref?.setString(_name, value);
  }

  String getName() {
    return _pref?.getString(_name) ?? "";
  }

  static setUserEmail(String value) async {
    _pref?.setString(_userEmail, value);
  }

  String getUserEmail() {
    return _pref?.getString(_userEmail) ?? "";
  }

  static setUserChatUrl(String value) async {
    _pref?.setString(_userChatUrl, value);
  }

  String getUserChatUrl() {
    return _pref?.getString(_userChatUrl) ?? "";
  }


  static setAccessToken(String value) async {
    _pref?.setString(_accessToken, value);
  }

  String getAccessToken() {
    return _pref?.getString(_accessToken) ?? "";
  }

  static setUserId(var value) async {
    _pref?.setString(_userId, value.toString());
  }

  String getUserId() {
    return _pref?.getString(_userId) ?? "";
  }

  static setUserLogin(var value) async {
    _pref?.setBool(_isUserLoggedIn, value);
  }

  bool getUserLogin() {
    return _pref?.getBool(_isUserLoggedIn) ?? false;
  }

  clearSharedPreference() {
    _pref?.clear();
  }
}
