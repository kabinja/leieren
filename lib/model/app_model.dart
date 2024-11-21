import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:leieren/model/word_model.dart';

part 'app_model.g.dart';

class AppModel extends ChangeNotifier {
  late String _title;
  late Configuration _configuration;
  late List<Section> _sections;

  String get title => _title;
  Configuration get configuration => _configuration;

  void setTitle(String title) {
    this._title = title;
  }

  void setConfiguration(Configuration configuration) {
    this._configuration = configuration;
  }

  void setSections(List<Section> sections) {
    this._sections = sections;
  }
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
