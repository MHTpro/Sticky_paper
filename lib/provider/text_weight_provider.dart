import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextWeightProvider extends ChangeNotifier {
  late SharedPreferences _preferences1;
  final String _key1 = 'saveTextWeight';

  int weightStyles = 1;

  Future<void> loadSavedTextWeight() async {
    _preferences1 = await SharedPreferences.getInstance();
    weightStyles = _preferences1.getInt(_key1) ?? 1;
    notifyListeners();
  }

  Future<void> saveTextWeght() async {
    await _preferences1.setInt(_key1, weightStyles);
  }

  thinWeight() {
    weightStyles = 1;

    notifyListeners();
  }

  regularWeight() {
    weightStyles = 2;

    notifyListeners();
  }

  boldWeight() {
    weightStyles = 3;

    notifyListeners();
  }

  heavyWeight() {
    weightStyles = 4;

    notifyListeners();
  }
}
