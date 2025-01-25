import 'package:flutter/material.dart';
import 'package:painting/ColorSlider.dart';
import 'StateManager.dart';
import 'Canvas.dart';
import 'Undo.dart';
import 'StrokeWidthSlider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ColorPallete(
          notifier: ColorPalleteNotifier(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('painting'),
          actions: [
            Align(
              alignment: Alignment.topRight,
              child: UndoButtonBar(),
            )
          ],
        ),
        body: Stack(
          children: [
            CanvasArea(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ColorSlider(),
                  StrokeWidthSlider(),
                ],
              ),
            ),
            
          ],
        ));
  }
}
