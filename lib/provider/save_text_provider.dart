import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextProvider extends ChangeNotifier {
  //controller
  TextEditingController controller = TextEditingController();
  late SharedPreferences _preferences;
  final String _key = 'savedText';

  Future<void> loadSavedText() async {
    _preferences = await SharedPreferences.getInstance();
    controller.text = _preferences.getString(_key) ?? '';
  }

  Future<void> saveText() async {
    await _preferences.setString(_key, controller.text);
    notifyListeners();
  }
  //
}
