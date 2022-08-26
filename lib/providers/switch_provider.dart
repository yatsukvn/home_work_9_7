import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier {
  bool _value = false;
  bool get switchValue => _value;

  void toggleValue(bool newValue) {
    _value = newValue;
    notifyListeners();
  }
}
