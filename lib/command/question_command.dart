import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/word_model.dart';

class Question {
  final List<String> question;
  final List<String> answer;

  Question(this.question, this.answer);
}

class FetchWordQuestionCommand extends BaseCommand {
  Future<Question?> run(int position) async {
    if (position >= wordListModel.words.length) {
      return null;
    }

    final Word word = await wordListModel.lock.protect(() async {
      return wordListModel.words[position];
    });

    final List<String> question = word.question();
    final List<String> answer = word.answer();

    return Question(question, answer);
  }
}
