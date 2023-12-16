import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextColorProvider extends ChangeNotifier {
  bool isBlack = true;

  late SharedPreferences _preferences1;
  final String _key1 = 'saveTextColor';

  Future<void> loadSavedTextColor() async {
    _preferences1 = await SharedPreferences.getInstance();
    isBlack = _preferences1.getBool(_key1) ?? true;
    notifyListeners();
  }

  Future<void> saveTextColor() async {
    await _preferences1.setBool(_key1, isBlack);
    notifyListeners();
  }

  whiteColor() {
    isBlack = false;
    notifyListeners();
  }

  blackColor() {
    isBlack = true;
    notifyListeners();
  }
}
