import 'package:flutter/cupertino.dart';
import 'package:mutex/mutex.dart';

enum Field { value, translation, plural, gender, grammar }

enum Gender { masculine, feminine, neutral }

class Word {
  final String value;
  final String translation;
  final int level;

  Word(this.level, this.value, this.translation);

  String? getFieldValue(Field field) {
    if (field == Field.value) {
      return value;
    }

    if (field == Field.translation) {
      return translation;
    }

    return null;
  }
}

class Verb extends Word {
  final String firstSingular;
  final String secondSingular;
  final String thirdSingular;
  final String firstPlural;
  final String secondPlural;
  final String thirdPlural;

  Verb(
      int level,
      String value,
      String translation,
      this.firstSingular,
      this.secondSingular,
      this.thirdSingular,
      this.firstPlural,
      this.secondPlural,
      this.thirdPlural)
      : super(level, value, translation);
}

class Noun extends Word {
  final Gender gender;
  final String plural;

  Noun(int level, String value, String translation, this.gender, this.plural)
      : super(level, value, translation);

  @override
  String? getFieldValue(Field field) {
    if (field == Field.gender) {
      return gender.toString();
    }

    if (field == Field.plural) {
      return plural;
    }

    return super.getFieldValue(field);
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
