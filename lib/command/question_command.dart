import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/content_model.dart';

class Question {
  final String question;
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

    final Configuration configuration = appModel.configuration;
    final String question = wordService.question(word);
    final List<String> answer = wordService.answer(word, configuration);

    return Question(question, answer);
  }
}
