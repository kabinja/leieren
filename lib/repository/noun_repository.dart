import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';
import 'package:leieren/repository/gender_repository.dart';
import 'package:leieren/repository/word_repository.dart';
import 'package:leieren/repository/word_type_repository.dart';

class Noun {
  final Word word;
  final NounExtra nounExtra;

  Noun(this.word, this.nounExtra);
}

class NounRepository {
  final AppDatabase db;
  final WordRepository wordRepository;

  NounRepository(this.db) : wordRepository = WordRepository(db);

  Future<Noun> getById(int id) async {
    final result = await (db.select(db.words)
          ..where(
            (t) => t.id.equals(id),
          ))
        .join([
      innerJoin(db.nounExtras, db.nounExtras.word.equalsExp(db.words.id)),
    ]).getSingle();

    return Noun(result.readTable(db.words), result.readTable(db.nounExtras));
  }

  Future<Noun?> findByValue(int sectionId, String value) async {
    final word = await wordRepository.findByValue(sectionId, value);

    if (word == null) {
      return Future.value(null);
    }

    return getById(word.id);
  }

  Future<Noun> createOrUpdate({
    required int sectionId,
    required String value,
    required String translation,
    required String gender,
    required String? plural,
  }) async {
    final word = await wordRepository.createOrUpdate(
      sectionId: sectionId,
      value: value,
      translation: translation,
      wordType: TypeEnum.noun,
    );

    var nounExtra = await (db.select(db.nounExtras)
          ..where(
            (t) => t.word.equals(word.id),
          ))
        .getSingleOrNull();

    if (nounExtra == null) {
      final genderData = await GenderRepository(db).get(gender);
      await db.into(db.nounExtras).insert(NounExtrasCompanion(
            word: Value(word.id),
            gender: Value(genderData.id),
            plural: Value(plural),
          ));
      return await getById(word.id);
    }
    await db.update(db.words)
      ..where((t) => t.id.equals(word.id));
    return getById(word.id);
  }
}
