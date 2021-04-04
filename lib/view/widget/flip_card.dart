import 'dart:math';

import 'package:flutter/material.dart';

enum Side {
  FRONT,
  BACK
}

class FlipCard extends StatefulWidget {
  final Key key;
  final Side side;
  final String front;
  final String back;
  final Function(Key, Side) onFlipCard;

  FlipCard({this.key, this.side, this.front, this.back, this.onFlipCard});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  Side currentSide;

  @override
  void initState() {
    super.initState();
    currentSide = widget.side;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _flipAnimation(),
    );
  }

  Widget _buildLayout({Key key, String faceName, Color color}) {
    return Card(
      key: key,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(faceName, style: TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }

  Widget _buildFront() {
    return _buildLayout(
        key: ValueKey(true),
        faceName: widget.front,
        color: Colors.blue
    );
  }

  Widget _buildRear() {
    return _buildLayout(
        key: ValueKey(false),
        faceName: widget.back,
        color: Color(0xFF0366A7)
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(currentSide == Side.FRONT) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
        isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _flipAnimation() {
    return GestureDetector(
      onTap: () => {
          widget.onFlipCard(widget.key, currentSide == Side.FRONT ? Side.BACK: Side.FRONT),
          setState(() => currentSide = currentSide == Side.FRONT ? Side.BACK: Side.FRONT)
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: currentSide == Side.FRONT ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }
}