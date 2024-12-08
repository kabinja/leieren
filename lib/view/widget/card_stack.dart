import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leieren/command/question_command.dart';

import 'flip_card.dart';

List<Alignment> cardsAlign = [
  Alignment(1.0, 1.0),
  Alignment(0.5, 0.5),
  Alignment(0.0, 0.0)
];

class CardStack extends StatefulWidget {
  final Size cardSize;

  CardStack({required this.cardSize});

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {
  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  final QuestionCommand questionCommand = QuestionCommand();
  late AnimationController _swipeController;

  Alignment frontCardAlign = cardsAlign[2];
  Side frontCardSide = Side.FRONT;
  double frontCardRot = 0.0;
  bool dirty = false;

  @override
  void initState() {
    super.initState();
    _swipeController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _swipeController,
        builder: (_, child) {
          return Expanded(
            child: FutureBuilder(
                builder: (context, AsyncSnapshot<List<Question?>> snapshot) {
                  return Stack(
                    children: <Widget>[
                      _backCard(snapshot.data?[2]),
                      _middleCard(snapshot.data?[1]),
                      _frontCard(snapshot.data?[0]),
                      snapshot.data?[0] != null
                          ? _controllerZone()
                          : Container(),
                    ],
                  );
                },
                future: Future.value(
                  questionCommand.fetch(3),
                )),
          );
        });
  }

  void onAnimationCompleted() {
    _resetFrontCardPosition();
  }

  Widget _backCard(Question? question) {
    if (question == null) {
      return Container();
    }

    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: dirty
              ? CardsAnimation.backCardAlignmentAnim(_swipeController).value
              : cardsAlign[0],
          child: SizedBox.fromSize(
            size: widget.cardSize,
            child: FlipCard(
                key: UniqueKey(),
                side: Side.FRONT,
                front: question.question,
                back: question.answer),
          ),
        ));
  }

  Widget _middleCard(Question? wordQuestion) {
    if (wordQuestion == null) {
      return Container();
    }

    print(wordQuestion.question);

    return IgnorePointer(
        ignoring: true,
        child: Align(
          alignment: dirty
              ? CardsAnimation.middleCardAlignmentAnim(_swipeController).value
              : cardsAlign[1],
          child: SizedBox.fromSize(
            size: widget.cardSize,
            child: FlipCard(
                key: UniqueKey(),
                side: Side.FRONT,
                front: wordQuestion.question,
                back: wordQuestion.answer),
          ),
        ));
  }

  Widget _frontCard(Question? wordQuestion) {
    if (wordQuestion == null) {
      return Container();
    }

    return IgnorePointer(
        ignoring: false,
        child: Align(
            alignment: dirty
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
                    front: wordQuestion.question,
                    back: wordQuestion.answer,
                    onFlipCard: (Key key, Side side) {
                      frontCardSide = side;
                    }),
              ),
            )));
  }

  Widget _controllerZone() {
    return !dirty
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
                _resetFrontCardPosition();
              }
            },
          ))
        : Container();
  }

  void _animateCards() {
    dirty = true;
    _swipeController.stop();
    _swipeController.value = 0.0;
    _swipeController.forward().whenComplete(() => onAnimationCompleted());
  }

  void _resetFrontCardPosition() {
    setState(() {
      frontCardAlign = defaultFrontCardAlign;
      frontCardRot = 0.0;
      frontCardSide = Side.FRONT;
      dirty = false;
    });
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
