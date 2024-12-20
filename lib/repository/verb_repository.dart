import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';
import 'package:leieren/repository/pronoun_repository.dart';
import 'package:leieren/repository/word_repository.dart';
import 'package:leieren/repository/word_type_repository.dart';

class Conjugated {
  final String pronoun;
  final String verb;

  Conjugated({
    required this.pronoun,
    required this.verb,
  });
}

class Verb {
  final Word _word;

  Verb(this._word);
}

class VerbRepository {
  final AppDatabase db;
  final WordRepository wordRepository;

  VerbRepository(this.db, this.wordRepository);

  Future<Verb> createOrUpdate({
    required int sectionId,
    required String value,
    required String tense,
    required String translation,
    required List<Conjugated> conjugated,
  }) async {
    final word = await wordRepository.createOrUpdate(
      sectionId: sectionId,
      value: value,
      specifier: tense,
      translation: translation,
      wordType: TypeEnum.verb,
    );

    conjugated.asMap().forEach((index, conjugated) {
      _createOrUpdateConjudated(
        word: word.id,
        position: index,
        pronoun: conjugated.pronoun,
        verb: conjugated.verb,
      );
    });

    return getById(word.id);
  }

  void _createOrUpdateConjudated({
    required int word,
    required int position,
    required String pronoun,
    required String verb,
  }) async {
    final verbExtra = await (db.select(db.verbExtras)
          ..where((t) => t.id.equals(word) & t.position.equals(position)))
        .getSingleOrNull();
    final pronounData = await PronounRepository(db).createIfNotExist(pronoun);
    if (verbExtra == null) {}
  }
}
