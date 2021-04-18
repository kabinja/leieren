import 'package:flutter/material.dart';
import 'package:leieren/view/page/score_page.dart';
import 'package:leieren/view/page/settings_page.dart';

import 'home_page.dart';

class Navigation extends StatelessWidget {
  final Widget child;

  const Navigation({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[child],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) => onTabTapped(context, index),
          currentIndex: getIndex(),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.score),
              label: 'Score',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        ));
  }

  void onTabTapped(BuildContext context, int index) {
    late Widget next;

    if(index == 0) next = HomePage();
    if(index == 1) next = ScorePage();
    if(index == 2) next = SettingsPage();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => next),
    );
  }

  int getIndex() {
    if (this.child is HomePage) return 0;
    if (this.child is ScorePage) return 1;
    if (this.child is SettingsPage) return 2;

    return 0;
  }
}
