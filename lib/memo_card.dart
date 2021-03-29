import 'package:flutter/material.dart';

class MemoCard extends StatelessWidget {
  Color _color;

  MemoCard(Color color){
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

}