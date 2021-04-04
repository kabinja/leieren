import 'package:flutter/material.dart';
import 'package:leieren/command/words_command.dart';
import 'package:leieren/view/widget/card_stack.dart';

class CardStackPage extends StatefulWidget {
  @override
  _CardStackPageState createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            _cardStackWidget(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.score),
              label: 'Score',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }

  Widget _cardStackWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState != ConnectionState.done) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }

        return CardStack(context);
      },
      future: LoadWordsCommand().run(1, 5),
    );
  }
}
