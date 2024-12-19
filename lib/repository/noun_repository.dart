import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';
import 'package:leieren/repository/gender_repository.dart';
import 'package:leieren/repository/word_repository.dart';
import 'package:leieren/repository/word_type_repository.dart';

class Noun {
  final Word _word;
  final NounExtra _nounExtra;
  final Gender _gender;

  int get id => _word.id;
  int get section => _word.section;
  String get value => _word.value;
  String get transaction => _word.translation;
  DateTime get createdAt => _word.createdAt;
  String? get plural => _nounExtra.plural;
  String get gender => _gender.short;

  Noun(this._word, this._nounExtra, this._gender);
}

class NounRepository {
  final AppDatabase db;
  final WordRepository wordRepository;

  NounRepository(this.db) : wordRepository = WordRepository(db);

  Future<Noun?> findById(int id) async {
    final result = await (db.select(db.words)
          ..where(
            (t) => t.id.equals(id),
          ))
        .join([
      innerJoin(db.nounExtras, db.nounExtras.word.equalsExp(db.words.id)),
      innerJoin(db.genders, db.nounExtras.gender.equalsExp(db.genders.id))
    ]).getSingleOrNull();

    return Noun(
      result!.readTable(db.words),
      result.readTable(db.nounExtras),
      result.readTable(db.genders),
    );
  }

  Future<Noun?> find(int sectionId, String value, String translation) async {
    final type = await WordTypeRepository(db).get(TypeEnum.noun);
    final word = await wordRepository.find(
      sectionId: sectionId,
      value: value,
      specifier: null,
      translation: translation,
      typeId: type.id,
    );

    if (word == null) {
      return Future.value(null);
    }

    return findById(word.id);
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
      specifier: null,
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
      return await findById(word.id) as Noun;
    }
    await db.update(db.words)
      ..where((t) => t.id.equals(word.id));
    return findById(word.id) as Noun;
  }
}
