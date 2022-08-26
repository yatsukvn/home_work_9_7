import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorProvider>.value(value: ColorProvider()),
          ChangeNotifierProvider<SwitchProvider>.value(value: SwitchProvider()),
        ],
        child: HomeworkPage(),
      ),
    );
  }
}

class HomeworkPage extends StatelessWidget {
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _value = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homework provider',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ColorSquareWidget(),
            ToggleWidget(),
          ],
        ),
      ),
    );
  }
}

class ColorSquareWidget extends StatelessWidget {
  const ColorSquareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorProvider state = Provider.of<ColorProvider>(context);

    return AnimatedContainer(
      width: 240.0,
      height: 240.0,
      color: state.colorValue,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }
}

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchProvider state = Provider.of<SwitchProvider>(context);
    return Switch(
      value: state.switchValue,
      onChanged: (bool value) {
        state._toggleValue(value);
      },
    );
  }
}

class ColorProvider extends ChangeNotifier {
  Color _color = Colors.blue;
  Color get colorValue => _color;
  final max = 255;

  void _randomColor() {
    _color = Color.fromARGB(
      max,
      Random().nextInt(max),
      Random().nextInt(max),
      Random().nextInt(max),
    );
    notifyListeners();
  }
}

class SwitchProvider extends ChangeNotifier {
  bool _value = false;
  bool get switchValue => _value;

  void _toggleValue(bool newValue) {
    _value = newValue;
    notifyListeners();
  }
}
