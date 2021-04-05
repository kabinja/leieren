import 'package:flutter/material.dart';
import 'package:leieren/command/words_command.dart';
import 'package:leieren/model/word.dart';
import 'package:leieren/view/page/navigation.dart';
import 'package:leieren/view/widget/card_stack.dart';
import 'package:provider/provider.dart';

class CardStackPage extends StatefulWidget {
  @override
  _CardStackPageState createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage> {
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

          return Consumer<WordListModel>(
            builder: (context, model, _) => CardStack(context, model),
          );
        },
        future: LoadWordsCommand().run(5),
      ),
    );
  }
}
