import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/word.dart';

class LoadWordsCommand extends BaseCommand {
  Future<List<Word>> run(int level, int limit) async {
     List<Word> words = await wordService.getWords(level, limit);
     wordListModel.words = words;

     return words;
  }
}

class ValidateWordCommand extends BaseCommand {
  Future<List<Word>> run() async {
    List<Word> words = wordListModel.words;
    words.removeAt(0);

    if(words.length < 5) {
      List<Word> newWords = await wordService.getWords(1, 5);
      words.addAll(newWords);
    }

    wordListModel.words = words;

    return wordListModel.words;
  }
}