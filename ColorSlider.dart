import 'package:flutter/material.dart';
import 'ColorToHsv.dart';
import 'StateManager.dart';

class ColorSlider extends StatelessWidget {
  void _onChanged(BuildContext context, double value) {
    final colorPallete = ColorPallete.of(context);
    colorPallete.changeColor(ColorHelper.hueToColor(value));
  }

  @override
  Widget build(BuildContext context) {
    final colorPallete = ColorPallete.of(context);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
          padding: const EdgeInsets.all(24),
          child: Stack(children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    for (var i = 0; i <= 360; i++)
                      HSVColor.fromAHSV(1.0, i.toDouble(), 1.0, 1.0).toColor()
                  ],
                  stops: [
                    for (var i = 0; i <= 360; i++) (i / 360).toDouble(),
                  ],
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.transparent, // アクティブ部分を透明に
                inactiveTrackColor: Colors.transparent, // 非アクティブ部分を透明に
              ),
              child: Slider(
                value: ColorHelper.colorToHue(colorPallete.selectedColor),
                onChanged: (value) => _onChanged(context, value),
                min: 0,
                max: 360,
              ),
            )
          ])),
    ]);
  }
}
