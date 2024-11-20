import 'package:flutter/cupertino.dart';
import 'package:mutex/mutex.dart';

enum Field { value, translation, plural, gender, grammar }

enum Gender { masculine, feminine, neutral }

class Word {
  final String value;
  final String translation;

  Word(this.value, this.translation);

  List<String> question() {
    return [this.translation];
  }

  List<String> answer() {
    return [this.value];
  }
}

class Expression extends Word {
  Expression(super.value, super.translation);
}

class Verb extends Word {
  final List<String> conjugaison;
  final String tense;

  Verb(String value, String translation, this.conjugaison, this.tense)
      : super(value, translation);

  @override
  List<String> question() {
    return [this.translation, this.tense];
  }

  @override
  List<String> answer() {
    return [this.value, ...this.conjugaison];
  }
}

class Noun extends Word {
  final Gender gender;
  final String? plural;

  Noun(String value, String translation, this.gender, this.plural)
      : super(value, translation);

  @override
  List<String> answer() {
    if (plural == null) {
      return [this.value];
    }
    return [this.value, this.plural as String];
  }
}

class WordListModel extends ChangeNotifier {
  late List<Word> _words;
  final Mutex _lock = Mutex();

  Mutex get lock => _lock;
  List<Word> get words => _words;

  set words(List<Word> words) {
    _words = words;
    notifyListeners();
  }
}
