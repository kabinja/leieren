import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mutex/mutex.dart';

part 'word_model.g.dart';

@JsonSerializable()
class Word {
  final String value;
  final String translation;

  Word(this.value, this.translation);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}

@JsonSerializable()
class Expression extends Word {
  Expression(super.value, super.translation);

  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionToJson(this);
}

@JsonSerializable()
class Verb extends Word {
  final List<String> conjugaison;
  final String tense;

  Verb(String value, String translation, this.conjugaison, this.tense)
      : super(value, translation);

  factory Verb.fromJson(Map<String, dynamic> json) => _$VerbFromJson(json);

  Map<String, dynamic> toJson() => _$VerbToJson(this);
}

@JsonSerializable()
class Noun extends Word {
  final String gender;
  final String? plural;

  Noun(String value, String translation, this.gender, this.plural)
      : super(value, translation);

  factory Noun.fromJson(Map<String, dynamic> json) => _$NounFromJson(json);

  Map<String, dynamic> toJson() => _$NounToJson(this);
}

@JsonSerializable()
class Section {
  final String section;
  @JsonKey(defaultValue: [])
  final List<Expression> expressions;
  @JsonKey(defaultValue: [])
  final List<Noun> nouns;
  @JsonKey(defaultValue: [])
  final List<Verb> verbs;
  @JsonKey(defaultValue: [])
  final List<Word> words;

  Section(this.section, this.expressions, this.nouns, this.verbs, this.words);

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
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
