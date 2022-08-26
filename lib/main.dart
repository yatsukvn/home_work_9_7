import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:home_work_9_7/providers/color_provider.dart';
import 'package:home_work_9_7/providers/switch_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorsProvider>.value(value: ColorsProvider()),
          ChangeNotifierProvider<SwitchProvider>.value(value: SwitchProvider()),
        ],
        child: const HomeworkPage(),
      ),
    );
  }
}

class HomeworkPage extends StatelessWidget {
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorsProvider state = Provider.of<ColorsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homework provider',
          style: TextStyle(
            color: state.colorTextValue,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
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
    ColorsProvider state = Provider.of<ColorsProvider>(context);

    return AnimatedContainer(
      width: 240.0,
      height: 240.0,
      color: state.colorSquareValue,
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
    ColorsProvider colorState = Provider.of<ColorsProvider>(context);
    return Switch(
      value: state.switchValue,
      onChanged: (bool value) {
        colorState.randomColor();
        state.toggleValue(value);
      },
    );
  }
}
