import 'dart:math';
import 'package:leieren/model/word_model.dart';

// List<Word> words = <Word>[
//   Noun("Faarf", "Color", Gender.feminine, "Faarwen"),
//   Noun("Fändel", "Flag", Gender.masculine, "Fändelen"),
//   Noun("Nationalitéit", "Nationality", Gender.feminine, "Nationalitéiten"),
//   Noun("Sprooch", "Language", Gender.feminine, "Sproochen"),
//   Noun("Stad", "City", Gender.feminine, "Stied"),
//   Word("Vu wou?", "from where?"),
//   Word("Wat?", "what?"),
//   Word("Wéi?", "how?"),
//   Word("Wéini", "when?"),
//   Word("Wéi geet et?", "How are you?"),
//   Word("Wien", "who?"),
//   Word("Wou?", "where"),
//   Word("Wéi schreift een dat?", "how does one write that?"),
//   Word("Entschëllegt", "Excuse me"),
//   Word("Äddi", "Goodbye (Informal)"),
//   Word("Awar", "Goodbye (Formal)"),
//   Word("Bonjour", "Hello (Formal)"),
//   Word("Gudde Moien", "Good morning"),
//   Word("Gudde Mëtteg", "Good afternoon"),
//   Word("Gudden Owend", "Good evening"),
//   Word("Gutt Nuecht", "Good night"),
//   Word("Moien", "Hello"),
//   Word("Shéine Mëtteg", "Have a nice afternoon"),
//   Word("Shéinen Owen", "Have a nice evening"),
//   Word("Shéinen Dag", "Have a nice day"),
//   Word("schéinen", "beautiful"),
//   Word("Ganz gutt", "very good"),
//   Word("Guer net gutt", "not good at all"),
//   Word("gut", "good"),
//   Word("schlecht", "bad"),
//   Word("tipptopp", "super"),
//   Word("einfach", "easy"),
//   Word("schwéier", "hard"),
//   Noun("Familljennumm", "Last name", Gender.masculine, "Familljennimm"),
//   Noun("Numm", "Name", Gender.masculine, "Nimm"),
//   Noun("Virnumm", "First name", Gender.masculine, "Virnimm"),
//   Word("Et freet mech", "Pleased to meet you"),
//   Word("Gär geschitt", "You're welcome"),
//   Word("Merci", "Thank you"),
//   Word("Merci gläichfalls", "Thank you, the same to you"),
//   Word("Villmools Merci", "Thanks a lot"),
//   Word("Wann ech gelift", "Please"),
//   Word("an", "and"),
//   Word("oder", "or"),
//   Word("Kee Problem", "No problem"),
// ];

class WordService {
  final random = new Random();

  Future<List<Word>> getWords(int limit) async {
    return List.generate(limit, (_) => words)
        .toList()[random.nextInt(words.length)];
  }
}
