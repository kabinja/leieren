// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
  json['title'] as String,
  json['language'] as String,
  json['level'] as String,
  Configuration.fromJson(json['configuration'] as Map<String, dynamic>),
  (json['sections'] as List<dynamic>)
      .map((e) => Section.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
  'title': instance.title,
  'language': instance.language,
  'level': instance.level,
  'configuration': instance.configuration,
  'sections': instance.sections,
};

VerbConfiguration _$VerbConfigurationFromJson(Map<String, dynamic> json) =>
    VerbConfiguration(
      (json['pronouns'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VerbConfigurationToJson(VerbConfiguration instance) =>
    <String, dynamic>{'pronouns': instance.pronouns};

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      VerbConfiguration.fromJson(json['verbs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{'verbs': instance.verbs};

Word _$WordFromJson(Map<String, dynamic> json) =>
    Word(json['value'] as String, json['translation'] as String);

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
  'value': instance.value,
  'translation': instance.translation,
};

Expression _$ExpressionFromJson(Map<String, dynamic> json) =>
    Expression(json['value'] as String, json['translation'] as String);

Map<String, dynamic> _$ExpressionToJson(Expression instance) =>
    <String, dynamic>{
      'value': instance.value,
      'translation': instance.translation,
    };

Conjugaison _$ConjugaisonFromJson(Map<String, dynamic> json) => Conjugaison(
  tense: json['tense'] as String,
  displayPronouns: json['displayPronouns'] as bool? ?? true,
  pronouns:
      (json['pronouns'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ConjugaisonToJson(Conjugaison instance) =>
    <String, dynamic>{
      'tense': instance.tense,
      'pronouns': instance.pronouns,
      'displayPronouns': instance.displayPronouns,
    };

Verb _$VerbFromJson(Map<String, dynamic> json) => Verb(
  json['value'] as String,
  json['translation'] as String,
  (json['conjugaison'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
  (json['pronouns'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
);

Map<String, dynamic> _$VerbToJson(Verb instance) => <String, dynamic>{
  'value': instance.value,
  'translation': instance.translation,
  'conjugaison': instance.conjugaison,
  'pronouns': instance.pronouns,
};

Noun _$NounFromJson(Map<String, dynamic> json) => Noun(
  json['value'] as String,
  json['translation'] as String,
  json['gender'] as String,
  json['plural'] as String?,
);

Map<String, dynamic> _$NounToJson(Noun instance) => <String, dynamic>{
  'value': instance.value,
  'translation': instance.translation,
  'gender': instance.gender,
  'plural': instance.plural,
};

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  json['section'] as String,
  (json['expressions'] as List<dynamic>?)
          ?.map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  (json['nouns'] as List<dynamic>?)
          ?.map((e) => Noun.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  (json['verbs'] as List<dynamic>?)
          ?.map((e) => Verb.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  (json['words'] as List<dynamic>?)
          ?.map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
  'section': instance.section,
  'expressions': instance.expressions,
  'nouns': instance.nouns,
  'verbs': instance.verbs,
  'words': instance.words,
};
