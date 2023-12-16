import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextDirectionProvider extends ChangeNotifier {
  bool isLtr = true;

  late SharedPreferences _preferences1;
  final String _key1 = 'saveTextDirection';

  Future<void> loadSavedTextAlign() async {
    _preferences1 = await SharedPreferences.getInstance();
    isLtr = _preferences1.getBool(_key1) ?? true;
    notifyListeners();
  }

  Future<void> saveTextAlign() async {
    await _preferences1.setBool(_key1, isLtr);
    notifyListeners();
  }

  textDirectionLtr() {
    isLtr = true;
    notifyListeners();
  }

  textDirectionRtl() {
    isLtr = false;
    notifyListeners();
  }
}
