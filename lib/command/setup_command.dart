import 'package:leieren/model/db/database.dart' as sql;
import 'package:leieren/model/json/content_model.dart' as json;
import 'package:leieren/repository/course_respository.dart';
import 'package:leieren/repository/noun_repository.dart';
import 'package:leieren/repository/section_repository.dart';
import 'package:leieren/repository/verb_repository.dart';
import 'package:leieren/repository/word_repository.dart';
import 'package:leieren/repository/word_type_repository.dart';
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
      final course = await CourseRespository(db).createOrUpdate(
        name: content.title,
        level: content.level,
        language: content.language,
      );

      await Future.forEach(content.sections.asMap().entries, (e) async {
        final section = await SectionRepository(db).createOrUpdate(
          courseId: course.id,
          name: e.value.section,
          number: e.key,
        );
        await this._setupWords(
          section.id,
          e.value.words,
        );
        await this._setupNouns(
          section.id,
          e.value.nouns,
        );
        await this._setupVerbs(
          section.id,
          e.value.verbs,
          content.configuration.verbs.pronouns,
        );
      });
    });
  }

  Future<void> _setupWords(int sectionId, List<json.Word> words) async {
    await Future.forEach(words, (w) async {
      await WordRepository(db).createOrUpdate(
        sectionId: sectionId,
        value: w.value,
        specifier: null,
        translation: w.translation,
        wordType: TypeEnum.word,
      );
    });
  }

  Future<void> _setupNouns(int sectionId, List<json.Noun> nouns) async {
    await Future.forEach(nouns, (n) async {
      await NounRepository(db).createOrUpdate(
        sectionId: sectionId,
        value: n.value,
        translation: n.translation,
        gender: n.gender,
        plural: n.plural,
      );
    });
  }

  Future<void> _setupVerbs(
    int sectionId,
    List<json.Verb> verbs,
    List<String> pronouns,
  ) async {
    await Future.forEach(verbs, (v) async {
      await Future.forEach(v.conjugaison.entries, (t) async {
        await VerbRepository(db).createOrUpdate(
          sectionId: sectionId,
          value: v.value,
          tense: t.key,
          translation: v.translation,
          conjugated: _setupConjugated(t.key, pronouns, v.pronouns, t.value),
        );
      });
    });
  }

  List<Conjugated> _setupConjugated(
    String tense,
    List<String> defaultPronouns,
    Map<String, List<String>>? specializedPronouns,
    List<String> verbs,
  ) {
    if (specializedPronouns == null) {
      return _buildConjugated(defaultPronouns, verbs);
    }

    if (specializedPronouns.containsKey(tense)) {
      return _buildConjugated(specializedPronouns[tense]!, verbs);
    }

    if (specializedPronouns.containsKey("*")) {
      return _buildConjugated(specializedPronouns["*"]!, verbs);
    }

    return _buildConjugated(defaultPronouns, verbs);
  }

  List<Conjugated> _buildConjugated(
    List<String> pronouns,
    List<String> verbs,
  ) {
    if (pronouns.length != verbs.length) {
      throw Exception("Invalid verb and pronouns combinaison");
    }

    return [
      for (int i = 0; i < pronouns.length; i += 1)
        Conjugated(pronoun: pronouns[i], verb: verbs[i])
    ];
  }
}
