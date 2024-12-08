import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable()
class Content {
  final String title;
  final Configuration configuration;
  final List<Section> sections;

  Content(this.title, this.configuration, this.sections);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class VerbConfiguration {
  final List<String> pronouns;

  VerbConfiguration(this.pronouns);

  factory VerbConfiguration.fromJson(Map<String, dynamic> json) =>
      _$VerbConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$VerbConfigurationToJson(this);
}

@JsonSerializable()
class NounConfiguration {
  final List<String> genders;
  final String plural;

  NounConfiguration(this.genders, this.plural);

  factory NounConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NounConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NounConfigurationToJson(this);
}

@JsonSerializable()
class Configuration {
  final VerbConfiguration verbs;
  final NounConfiguration nouns;

  Configuration(this.verbs, this.nouns);

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}

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
