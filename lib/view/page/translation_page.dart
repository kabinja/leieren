import 'package:flutter/material.dart';
import 'package:leieren/command/words_command.dart';
import 'package:leieren/model/word_model.dart';
import 'package:leieren/view/page/navigation.dart';
import 'package:leieren/view/widget/card_stack.dart';
import 'package:provider/provider.dart';

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

          return Consumer<WordListModel>(
            builder: (context, model, _) => CardStack(
              cardSize: Size(MediaQuery.of(context).size.width * 0.95, MediaQuery.of(context).size.height * 0.95),
              model: model,
              front: Field.translation,
              back: Field.value,
            ),
          );
        },
        future: LoadWordsCommand().run(5),
      ),
    );
  }
}
