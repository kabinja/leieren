import 'dart:math';

import 'package:leieren/model/word_model.dart';

List<Word> words = <Word>[
  Noun(1, "Fro", "Question", Gender.feminine, "Froen"),
  Noun(1, "Land", "Country", Gender.masculine, "Länner"),
  Verb(1, "heeschen", "to be called", "heeschen", "heeschs", "heescht", "heeschen", "heescht", "heeschen"),
  Noun(1, "Faarf", "Faarwen", Gender.feminine, "Color"),
  Noun(1, "Fändel", "Flag", Gender.masculine, "Fändelen"),
  Noun(1, "Nationalitéit", "Nationality", Gender.feminine, "Nationalitéiten"),
  Noun(1, "Sprooch", "Language", Gender.feminine, "Sproochen"),
  Noun(1, "Stad", "City", Gender.feminine, "Stied"),
  Verb(1, "kommen", "to come", "kommen", "kënns", "kënnt", "kommen", "kommt", "kommen"),
  Verb(1, "léieren", "to learn", "léieren", "léiers", "léiert", "léieren", "léiert", "léieren"),
  Verb(1, "schwätzen", "to speak", "schwätzen", "schwätz", "schwätzt", "schwätzen", "schwätzt", "schwätzen"),
  Word(1, "Vu wou?", "from where?"),
  Word(1, "Wat?", "what?"),
  Word(1, "Wéi?", "how?"),
  Word(1, "Wéini", "when?"),
  Word(1, "Wéi geet et?", "How are you?"),
  Word(1, "Wien", "who?"),
  Word(1, "Wou?", "where"),
  Word(1, "Wéi schreift een dat?", "how does one write that?"),
  Word(1, "Entschëllegt", "Excuse me"),
  Verb(1, "verstoen", "to understand", "verstinn", "verstees", "versteet", "verstinn", "verstitt", "verstinn"),
  Verb(1, "hëllefen", "to help", "hëllefen", "hëllefs", "hëlleft", "hëllefen", "hëlleft", "hëllefen"),
  Word(1, "Äddi", "Goodbye (Informal)"),
  Word(1, "Awar", "Goodbye (Formal)"),
  Word(1, "Bonjour", "Hello (Formal)"),
  Word(1, "Gudde Moien", "Good morning"),
  Word(1, "Gudde Mëtteg", "Good afternoon"),
  Word(1, "Gudden Owend", "Good evening"),
  Word(1, "Gutt Nuecht", "Good night"),
  Word(1, "Moien", "Hello"),
  Word(1, "Shéine Mëtteg", "Have a nice afternoon"),
  Word(1, "Shéinen Owen", "Have a nice evening"),
  Word(1, "Shéinen Dag", "Have a nice day"),
  Word(1, "schéinen", "beautiful"),
  Word(1, "Ganz gutt", "very good"),
  Word(1, "Guer net gutt", "not good at all"),
  Word(1, "gut", "good"),
  Word(1, "schlecht", "bad"),
  Word(1, "tipptopp", "super"),
  Word(1, "einfach", "easy"),
  Word(1, "schwéier", "hard"),
  Noun(1, "Familljennumm", "Last name", Gender.masculine, "Familljennimm"),
  Noun(1, "Numm", "Name", Gender.masculine, "Nimm"),
  Noun(1, "Virnumm", "First name", Gender.masculine, "Virnimm"),
  Verb(1, "buschtawéieren", "to spell", "buschtawéieren", "buschtawéiers", "buschtawéiert", "buschtawéieren", "buschtawéiert", "buschtawéieren"),
  Verb(1, "duzen", "to address someone informally", "duzen", "duz", "duzt", "duzen", "duzt", "duzen"),
  Verb(1, "schreiwen", "to write", "schreiwen", "schreifs", "schreift", "schreiwen", "schreift", "schreiwen"),
  Verb(1, "sinn", "to be", "sinn", "bass", "ass", "sinn", "sidd", "sinn"),
  Word(1, "Et freet mech", "Pleased to meet you"),
  Word(1, "Gär geschitt", "You're welcome"),
  Word(1, "Merci", "Thank you"),
  Word(1, "Merci gläichfalls", "Thank you, the same to you"),
  Word(1, "Villmools Merci", "Thanks a lot"),
  Word(1, "Wann ech gelift", "Please"),
  Word(1, "an", "and"),
  Word(1, "oder", "or"),
  Word(1, "Kee Problem", "No problem"),
];


class WordService {
  final random = new Random();

  Future<List<Word>> getWords(int level, int limit) async {
    return  List.generate(limit, (_) => words.where((w) => w.level <= level).toList()[random.nextInt(words.length)]);
  }
}