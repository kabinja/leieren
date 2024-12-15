import 'package:leieren/model/drift/database.dart' as sql;
import 'package:leieren/model/json/content_model.dart' as json;
import 'package:leieren/service/json_service.dart';
import 'package:http/http.dart' as http;

class SetupCommand {
  final http.Client client;
  final sql.AppDatabase db;

  SetupCommand(this.db, this.client);

  Future<void> loadData() async {
    final url =
        "https://raw.githubusercontent.com/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";
    final raw = await JsonService(this.client).fetchJson(url);
    final json.Content content = json.Content.fromJson(raw);
    await _populateDatabase(content);
  }

  Future<void> _populateDatabase(json.Content content) async {
    await this.db.transaction(() async {
      final course = await this.db.createOrUpdateCourse(
            name: content.title,
            level: content.level,
            language: content.language,
          );

      await Future.forEach(content.sections.asMap().entries, (e) async {
        final section = await this.db.createOrUpdateSection(
              courseId: course.id,
              name: e.value.section,
              number: e.key,
            );
        this._setupWords(section.id, e.value.words);
      });
    });
  }

  Future<void> _setupWords(int sectionId, List<json.Word> words) async {
    await Future.forEach(words, (w) async {
      final word = this.db.createOrUpdateWord(
            sectionId: sectionId,
            value: w.value,
            translation: w.translation,
          );
    });
  }
}
