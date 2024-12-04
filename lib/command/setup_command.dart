import 'dart:convert';

import 'package:leieren/command/base_command.dart';
import 'package:leieren/model/content_model.dart';

class SetupCommand extends BaseCommand {
  void setup() async {
    var authority = "raw.githubusercontent.com";
    var path =
        "/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";

    final jsonData = await jsonService.fetchJson(authority, path);
    final jsonParsed = jsonDecode(jsonData);
    final Content content = Content.fromJson(jsonParsed);
  }
}
