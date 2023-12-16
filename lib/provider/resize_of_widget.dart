import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SizeOfWidget extends ChangeNotifier {
  double containerWidth = Adaptive.w(90);

  double containerheight = Adaptive.h(90);

  changeSize() {
    containerWidth = Adaptive.w(90);
    containerheight = Adaptive.h(90);

    notifyListeners();
  }
}
