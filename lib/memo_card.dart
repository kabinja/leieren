import 'dart:math';

import 'package:flutter/material.dart';

class MemoCard extends StatefulWidget {
  final Key key;
  final String front;
  final String back;
  final Color color;

  MemoCard({this.key, this.front, this.back, this.color});

  @override
  _MemoCardState createState() => _MemoCardState();
}

class _MemoCardState extends State<MemoCard> {
  bool _displayFront;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildFlipAnimation(),
    );
  }

  Widget _buildLayout({Key key, String faceName, Color backgroundColor}) {
    return Card(
      key: key,
      color: backgroundColor,
      child: Center(
        child: Text(faceName, style: TextStyle(fontSize: 20.0)),
      ),
    );
  }

  Widget _buildFront() {
    return _buildLayout(
      key: ValueKey(true),
      backgroundColor: widget.color,
      faceName: widget.front,
    );
  }

  Widget _buildRear() {
    return _buildLayout(
      key: ValueKey(false),
      backgroundColor: widget.color,
      faceName: widget.back,
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_displayFront) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => setState(() => _displayFront = !_displayFront),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _displayFront ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }
}