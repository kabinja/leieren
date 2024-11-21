// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerbConfiguration _$VerbConfigurationFromJson(Map<String, dynamic> json) =>
    VerbConfiguration(
      (json['pronouns'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VerbConfigurationToJson(VerbConfiguration instance) =>
    <String, dynamic>{
      'pronouns': instance.pronouns,
    };

NounConfiguration _$NounConfigurationFromJson(Map<String, dynamic> json) =>
    NounConfiguration(
      (json['genders'] as List<dynamic>).map((e) => e as String).toList(),
      json['plural'] as String,
    );

Map<String, dynamic> _$NounConfigurationToJson(NounConfiguration instance) =>
    <String, dynamic>{
      'genders': instance.genders,
      'plural': instance.plural,
    };

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      VerbConfiguration.fromJson(json['verbs'] as Map<String, dynamic>),
      NounConfiguration.fromJson(json['nouns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'verbs': instance.verbs,
      'nouns': instance.nouns,
    };
