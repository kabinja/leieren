import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';
import 'package:leieren/repository/word_type_repository.dart';

class WordRepository {
  final AppDatabase db;

  WordRepository(this.db);

  Future<Word?> findByValue(int sectionId, String value) async {
    return await (db.select(db.words)
          ..where((t) => t.section.equals(sectionId) & t.value.equals(value)))
        .getSingleOrNull();
  }

  Future<Word> createOrUpdate({
    required int sectionId,
    required String value,
    required String translation,
    required TypeEnum wordType,
  }) async {
    final word = await this.findByValue(sectionId, value);
    if (word == null) {
      final type = await WordTypeRepository(db).get(wordType);
      final id = await db.into(db.words).insert(WordsCompanion(
            section: Value(sectionId),
            value: Value(value),
            translation: Value(translation),
            type: Value(type.id),
            createdAt: Value(DateTime.now()),
          ));
      return await (db.select(db.words)
            ..where(
              (t) => t.id.equals(id),
            ))
          .getSingle();
    }
    await db.update(db.words)
      ..where((t) => t.id.equals(word.id));
    return await (db.select(db.words)
          ..where(
            (t) => t.id.equals(word.id),
          ))
        .getSingle();
  }
}
