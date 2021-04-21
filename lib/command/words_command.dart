import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/word_model.dart';

class LoadWordsCommand extends BaseCommand {
  Future<List<Word>> run(int limit) async {
     List<Word> words = await wordService.getWords(appModel.level, limit);

     await wordListModel.lock.protect(() async {
       wordListModel.words = words;
    });

     return words;
  }
}

class FetchWordCommand extends BaseCommand {
  Future<List<Word?>> run(number) async {
    return await wordListModel.lock.protect(() async {
      List<Word> words = wordListModel.words;

      if(words.length <= number){
        words.fillRange(words.length, number, null);
      }

      return words.getRange(0, number).toList();
    });
  }
}

class ValidateWordCommand extends BaseCommand {
  Future<List<Word>> run() async {
    return await wordListModel.lock.protect(() async {
      List<Word> words = wordListModel.words;
      words.removeAt(0);

      if(words.length < 5) {
        List<Word> newWords = await wordService.getWords(appModel.level, 5);
        words.addAll(newWords);
      }

      wordListModel.words = words;

      return wordListModel.words;
    });
  }
}