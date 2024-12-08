class Question {
  final String type;
  final List<String> question;
  final List<String> answer;

  Question({required this.type, required this.question, required this.answer});
}

class QuestionCommand {
  Future<List<Question>> fetch(int number) {
    return Future.value([]);
  }
}
