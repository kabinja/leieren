import 'package:leieren/model/drift/database.dart';
import 'package:leieren/model/json/content_model.dart';
import 'package:leieren/service/json_service.dart';
import 'package:http/http.dart' as http;

class SetupCommand {
  final http.Client client;
  final AppDatabase db;

  SetupCommand(this.db, this.client);

  Future<void> loadData() async {
    final url =
        "https://raw.githubusercontent.com/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";
    final raw = await JsonService(this.client).fetchJson(url);
    final Content content = Content.fromJson(raw);
    await _populateDatabase(content);
  }

  Future<void> _populateDatabase(Content content) async {
    await this.db.transaction(() async {
      final course = await this.db.createOrUpdateCourse(
            name: content.title,
            level: content.level,
            language: content.language,
          );
    });
  }
}
