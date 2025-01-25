import 'package:flutter/material.dart';

class ColorPalleteNotifier extends ChangeNotifier{
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.lightBlue,
    Colors.blue,
    Colors.purple,
  ];

  int selectedIndex = 0;
  double strokeWidth = 5.0; 

  Color get selectedColor => colors[selectedIndex];

  void changeColor(Color newColor){
    colors[selectedIndex] = newColor;
    notifyListeners();
  }

  void select(int index){
    selectedIndex = index;
    notifyListeners();
  }

  void rebuild(){
    notifyListeners();
  }

  void changeStrokeWidth(double newStrokeWidth) {
    strokeWidth = newStrokeWidth;
    notifyListeners(); 
  }

}

class ColorPallete extends InheritedNotifier<ColorPalleteNotifier>{
  ColorPallete({
    Key? key,
    required ColorPalleteNotifier notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static ColorPalleteNotifier of(BuildContext context){ //この辺意味わからん
    return 
    context.
    dependOnInheritedWidgetOfExactType
    <ColorPallete>()!
    .notifier!;
  }
}