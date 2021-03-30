import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/word.dart';

class NextWordsCommand extends BaseCommand {
  List<Word> run(int level, int limit) {
     return wordService.getWords(level, limit);
  }
}