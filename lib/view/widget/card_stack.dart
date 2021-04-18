import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leieren/command/words_command.dart';
import 'package:leieren/model/word.dart';

import 'flip_card.dart';

List<Alignment> cardsAlign = [
  Alignment(1.0, 1.0),
  Alignment(0.5, 0.5),
  Alignment(0.0, 0.0)
];


class CardStack extends StatefulWidget {
  final WordListModel model;
  final Size cardSize;

  CardStack({required this.cardSize, required this.model});

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {

  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  late AnimationController _swipeController;

  Alignment frontCardAlign = cardsAlign[2];
  Side frontCardSide = Side.FRONT;
  double frontCardRot = 0.0;

  @override
  void initState() {
    super.initState();

    _swipeController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _swipeController.addListener(() => setState(() {}));
    _swipeController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        onAnimationFinished();
      }
    });
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: <Widget>[
        widget.model.words.length > 2 ?_backCard() : Container(),
        widget.model.words.length > 1 ?_middleCard()  : Container(),
        widget.model.words.isNotEmpty ? _frontCard()  : Container(),
        widget.model.words.isNotEmpty ? _controllerZone()  : Container(),
      ],
    ));
  }

  void onAnimationFinished(){
    ValidateWordCommand().run();
    _resetFrontCardPosition();
  }

  Widget _backCard() {
    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: _swipeController.status == AnimationStatus.forward
              ? CardsAnimation.backCardAlignmentAnim(_swipeController).value
              : cardsAlign[0],
          child: SizedBox.fromSize(
            size: widget.cardSize,
            child: FlipCard(
                key: UniqueKey(),
                side: Side.FRONT,
                front: widget.model.words[2].translation,
                back: widget.model.words[2].value),
          ),
        ));
  }

  Widget _middleCard() {
    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: _swipeController.status == AnimationStatus.forward
              ? CardsAnimation.middleCardAlignmentAnim(_swipeController).value
              : cardsAlign[1],
          child: SizedBox.fromSize(
            size: widget.cardSize,
            child: FlipCard(
                key: UniqueKey(),
                side: Side.FRONT,
                front: widget.model.words[1].translation,
                back: widget.model.words[1].value),
          ),
        ));
  }

  Widget _frontCard() {
    return IgnorePointer(
        ignoring: false,
        child: Align(
            alignment: _swipeController.status == AnimationStatus.forward
                ? CardsAnimation.frontCardDisappearAlignmentAnim(
                        _swipeController, frontCardAlign)
                    .value
                : frontCardAlign,
            child: Transform.rotate(
              angle: (pi / 180.0) * frontCardRot,
              child: SizedBox.fromSize(
                size: widget.cardSize,
                child: FlipCard(
                    key: UniqueKey(),
                    side: frontCardSide,
                    front: widget.model.words[0].translation,
                    back: widget.model.words[0].value,
                    onFlipCard: (Key key, Side side) {
                      frontCardSide = side;
                    }),
              ),
            )));
  }

  Widget _controllerZone() {
    return _swipeController.status != AnimationStatus.forward
        ? SizedBox.expand(
            child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                frontCardAlign = Alignment(
                    frontCardAlign.x +
                        20 *
                            details.delta.dx /
                            MediaQuery.of(context).size.width,
                    frontCardAlign.y +
                        40 *
                            details.delta.dy /
                            MediaQuery.of(context).size.height);

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

  void _animateCards() {
    _swipeController.stop();
    _swipeController.value = 0.0;
    _swipeController.forward();
  }

  void _resetFrontCardPosition() {
    frontCardAlign = defaultFrontCardAlign;
    frontCardRot = 0.0;
    frontCardSide = Side.FRONT;
  }
}

class CardsAnimation {
  static Animation<Alignment> backCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[0], end: cardsAlign[1]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Alignment> middleCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[1], end: cardsAlign[2]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(
      AnimationController parent, Alignment beginAlign) {
    return AlignmentTween(
            begin: beginAlign,
            end: Alignment(
                beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0,
                0.0))
        .animate(CurvedAnimation(
            parent: parent, curve: Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}
