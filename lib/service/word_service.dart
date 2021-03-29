import 'dart:math';

import 'package:leieren_flutter/model/word.dart';

List<Word> words = <Word>[
  Word("Moien", "Hello", 1),
  Word("Äddie", "Goodbye", 1),
  Word("Merci", "Thank you", 1),
  Word("Dag", "Day", 1),
];


class WordService {
  final random = new Random();

  List<Word> getWords(int level, int limit) {
    return  List.generate(limit, (_) => words.where((w) => w.level <= level).toList()[random.nextInt(words.length)]);
  }
}