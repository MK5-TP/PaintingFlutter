import 'package:flutter/material.dart';
import 'StateManager.dart';

class StrokeWidthSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorPallete = ColorPallete.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Slider(
            value: colorPallete.strokeWidth, // 現在の線の太さ
            onChanged: (value) {
              colorPallete.changeStrokeWidth(value); // 更新
            },
            min: 1.0, // 最小値
            max: 20.0, // 最大値
          ),
        ),
      ],
    );
  }
}
