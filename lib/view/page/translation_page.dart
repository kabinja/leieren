import 'package:flutter/material.dart';
import 'package:leieren/view/page/navigation.dart';
import 'package:leieren/view/widget/card_stack.dart';

class TranslationPage extends StatefulWidget {
  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  @override
  Widget build(BuildContext context) {
    return Navigation(
      child: FutureBuilder(
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

          return CardStack(
            cardSize: Size(MediaQuery.of(context).size.width * 0.95,
                MediaQuery.of(context).size.height * 0.95),
          );
        },
        future: Future.value([]),
      ),
    );
  }
}
