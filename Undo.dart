import 'package:flutter/material.dart';
import 'ColorPath.dart';
import 'StateManager.dart';

class UndoButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(Icons.undo_rounded),
          color: Colors.black38,
          onPressed: () => _undo(context),
        ),
        IconButton(
          icon: Icon(Icons.delete_rounded),
          color: Colors.black38,
          onPressed: () => _clear(context),
        ),
      ],
    );
  }

  void _clear(BuildContext context) {
    ColorPath.paths.clear();
    ColorPallete.of(context).rebuild();
  }

  void _undo(BuildContext context) {
    ColorPath.paths.removeLast();
    ColorPallete.of(context).rebuild();
  }
}