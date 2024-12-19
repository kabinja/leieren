import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';
import 'package:leieren/repository/word_type_repository.dart';

class WordRepository {
  final AppDatabase db;

  WordRepository(this.db);

  Future<Word?> findById(int id) async {
    return await (db.select(db.words)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<Word?> find({
    required int sectionId,
    required String value,
    required String? specifier,
    required String translation,
    required int typeId,
  }) async {
    return await (db.select(db.words)
          ..where((t) =>
              t.section.equals(sectionId) &
              t.specifier.equalsNullable(specifier) &
              t.value.equals(value) &
              t.translation.equals(translation) &
              t.type.equals(typeId)))
        .getSingleOrNull();
  }

  Future<Word> createOrUpdate({
    required int sectionId,
    required String value,
    required String translation,
    required String? specifier,
    required TypeEnum wordType,
  }) async {
    final type = await WordTypeRepository(db).get(wordType);
    final word = await this.find(
      sectionId: sectionId,
      value: value,
      specifier: specifier,
      translation: translation,
      typeId: type.id,
    );
    if (word == null) {
      final id = await db.into(db.words).insert(WordsCompanion(
            section: Value(sectionId),
            value: Value(value),
            specifier: Value(specifier),
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
