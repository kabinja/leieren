import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/word_model.dart';

class WordQuestion{
  final String question;
  final String answer;

  WordQuestion(this.question, this.answer);
}

class FetchWordQuestionCommand extends BaseCommand {
  Future<WordQuestion?> run(int position, Field questionField, Field answerField) async {
    if(position >= wordListModel.words.length){
      return null;
    }

    final Word word = await wordListModel.lock.protect(() async {
      return wordListModel.words[position];
    });

    final String? question = word.getFieldValue(questionField);
    final String? answer = word.getFieldValue(answerField);

    if(question == null || answer == null){
      return null;
    }

    return WordQuestion(question, answer);
  }
}