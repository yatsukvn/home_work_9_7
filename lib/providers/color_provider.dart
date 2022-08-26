import 'dart:math';

import 'package:flutter/material.dart';

class ColorsProvider extends ChangeNotifier {
  Color _colorText = Colors.blue;
  Color get colorTextValue => _colorText;

  Color _colorSquare = Colors.green;
  Color get colorSquareValue => _colorSquare;
  final max = 255;

  void randomColor() {
    _colorText = Color.fromARGB(
      max,
      Random().nextInt(max),
      Random().nextInt(max),
      Random().nextInt(max),
    );

    _colorSquare = Color.fromARGB(
      max,
      Random().nextInt(max),
      Random().nextInt(max),
      Random().nextInt(max),
    );
    notifyListeners();
  }
}
