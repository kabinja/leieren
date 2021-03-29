import 'dart:math';

import 'package:flutter/material.dart';

import 'memo_card.dart';

List<Alignment> cardsAlign = [
  Alignment(1.0, 1.0),
  Alignment(0.5, 0.5),
  Alignment(0.0, 0.0)
];

Size cardSize;

class CardStack extends StatefulWidget {
  CardStack(BuildContext context) {
    cardSize = Size(MediaQuery.of(context).size.width * 0.95, MediaQuery.of(context).size.height * 0.95);
  }

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> with SingleTickerProviderStateMixin {
  List<MemoCard> cards = <MemoCard>[];

  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  Alignment frontCardAlign;

  AnimationController _swipeController;
  double frontCardRot = 0.0;

  @override
  void initState() {
    super.initState();

    initSack();

    _swipeController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _swipeController.addListener(() => setState(() {}));
    _swipeController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _updateCardStack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
          children: <Widget>[
            _backCard(),
            _middleCard(),
            _frontCard(),
            _controllerZone()
          ],
        )
    );
  }

  void initSack(){
    for (int i = 0; i < 3; i++) {
      cards.add(MemoCard(key: UniqueKey(), front: "Front", back: "Back", color: _randomColor()));
    }

    frontCardAlign = cardsAlign[2];
  }

  Widget _backCard() {
    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: _swipeController.status == AnimationStatus.forward
              ? CardsAnimation.backCardAlignmentAnim(_swipeController).value
              : cardsAlign[0],
          child: SizedBox.fromSize(size: cardSize, child: cards[0],),
        )
    );
  }

  Widget _middleCard() {
    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: _swipeController.status == AnimationStatus.forward
              ? CardsAnimation.middleCardAlignmentAnim(_swipeController).value
              : cardsAlign[1],
          child: SizedBox.fromSize(size: cardSize, child: cards[1],),
        )
    );
  }

  Widget _frontCard() {
    return IgnorePointer(
        ignoring: false,
        child: Align(
        alignment: _swipeController.status == AnimationStatus.forward
            ? CardsAnimation.frontCardDisappearAlignmentAnim(_swipeController, frontCardAlign).value
            : frontCardAlign,
        child: Transform.rotate(
          angle: (pi / 180.0) * frontCardRot,
          child: SizedBox.fromSize(size: cardSize, child: cards[2]),
        ))
    );
  }

  Widget _controllerZone() {
    return _swipeController.status != AnimationStatus.forward
        ? SizedBox.expand(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              frontCardAlign = Alignment(
                  frontCardAlign.x + 20 * details.delta.dx / MediaQuery.of(context).size.width,
                  frontCardAlign.y + 40 * details.delta.dy / MediaQuery.of(context).size.height
              );

              frontCardRot = frontCardAlign.x;
            });
          },
          onPanEnd: (_) {
            if (frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0) {
              _animateCards();
            } else {
              setState(() {
                _resetFrontCardPosition();
              });
            }
          },
        ))
        : Container();
  }

  void _animateCards(){
    _swipeController.stop();
    _swipeController.value = 0.0;
    _swipeController.forward();
  }

  void _updateCardStack() {
    setState(() {
      cards[2] = cards[1];
      cards[1] = cards[0];
      cards[0] = MemoCard(key: UniqueKey(), front:"Front", back:"Back", color:_randomColor());

      _resetFrontCardPosition();
    });
  }

  void _resetFrontCardPosition(){
    frontCardAlign = defaultFrontCardAlign;
    frontCardRot = 0.0;
  }

  Color _randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}

class CardsAnimation {
  static Animation<Alignment> backCardAlignmentAnim(AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[0], end: cardsAlign[1]).animate(
        CurvedAnimation(parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn))
    );
  }

  static Animation<Alignment> middleCardAlignmentAnim(AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[1], end: cardsAlign[2]).animate(
        CurvedAnimation(parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn))
    );
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(AnimationController parent, Alignment beginAlign) {
    return AlignmentTween(
        begin: beginAlign,
        end: Alignment(beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0, 0.0)
    )
        .animate(CurvedAnimation(parent: parent, curve: Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}