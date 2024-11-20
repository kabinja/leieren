import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  late String _title;
  late Configuration _configuration;

  String get title => _title;
  Configuration get configuration => _configuration;

  void setTitle(String title) {
    this._title = title;
  }

  void setConfiguration(Configuration configuration) {
    this._configuration = configuration;
  }
}

class VerbConfiguration {
  final List<String> pronouns;

  VerbConfiguration(this.pronouns);
}

class NounConfiguration {
  final List<String> genders;
  final String plural;

  NounConfiguration(this.genders, this.plural);
}

class Configuration {
  final VerbConfiguration verbs;
  final NounConfiguration nouns;

  Configuration(this.verbs, this.nouns);

  factory Configuration.fromJson(Map<String, dynamic> data) {
    final verbs = data["verbs"];
    final nouns = data["nouns"];

    return Configuration(verbs, nouns);
  }
}
