import 'dart:convert';

import 'package:leieren/model/json/content_model.dart';
import 'package:leieren/service/json_service.dart';

class SetupCommand {
  void loadData(JsonService jsonService) async {
    var authority = "raw.githubusercontent.com";
    var path =
        "/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";

    final jsonData = await jsonService.fetchJson(authority, path);
    final jsonParsed = jsonDecode(jsonData);
    final Content content = Content.fromJson(jsonParsed);
  }
}
