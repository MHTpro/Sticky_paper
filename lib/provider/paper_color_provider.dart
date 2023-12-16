import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaperColorProvider extends ChangeNotifier {
  late SharedPreferences _preferences1;
  final String _key1 = 'saveColorPaper';

  Future<void> loadSavedColorPaper() async {
    _preferences1 = await SharedPreferences.getInstance();
    currentColorPaper = _preferences1.getString(_key1) ?? 'yellow';
    notifyListeners();
  }

  Future<void> saveColorPaper() async {
    await _preferences1.setString(_key1, currentColorPaper);
  }

  String currentColorPaper = "yellow";

  String purplePaper = 'purple';
  String blackPaper = 'black';
  String bluePaper = 'blue';
  String cyanPaper = 'cyan';
  String grayPaper = 'gray';
  String greenPaper = 'green';
  String orangePaper = 'orange';
  String pinkPaper = 'pink';
  String redPaper = 'red';
  String whitePaper = 'white';
  String yellowPaper = 'yellow';

  List<String>? colorPaperList;

  changeColorofPaper(int colorIndex) {
    colorPaperList = [
      purplePaper,
      blackPaper,
      bluePaper,
      cyanPaper,
      grayPaper,
      greenPaper,
      orangePaper,
      pinkPaper,
      redPaper,
      whitePaper,
      yellowPaper
    ];
    currentColorPaper = colorPaperList![colorIndex];

    notifyListeners();
  }
}
