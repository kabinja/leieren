import 'dart:convert';

import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/app_model.dart';
import 'package:leieren/model/word_model.dart';

class SetupCommand extends BaseCommand {
  void _load_configuration(Map<String, dynamic> json) {
    final configuration = Configuration.fromJson(json);
    appModel.setConfiguration(configuration);
  }

  void _load_data(Map<String, dynamic> json) {
    final sections = (json as List).map((e) => Section.fromJson(e)).toList();
    appModel.setSections(sections);
  }

  void setup() async {
    var authority = "raw.githubusercontent.com";
    var path =
        "/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";

    final jsonData = await jsonService.fetchJson(authority, path);
    final jsonParsed = jsonDecode(jsonData);

    appModel.setTitle(jsonParsed["title"] as String);
    this._load_configuration(jsonParsed["configuration"]);
    this._load_data(jsonParsed["data"]);
  }
}
