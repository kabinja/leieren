import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';

class PronounRepository {
  final AppDatabase db;

  PronounRepository(this.db);

  Future<Pronoun> get(String name) async {
    return await (db.select(db.pronouns)..where((t) => t.value.equals(name)))
        .getSingle();
  }

  Future<Pronoun> createIfNotExist(String name) async {
    final pronoun = await (db.select(db.pronouns)
          ..where((t) => t.value.equals(name)))
        .getSingleOrNull();

    if (pronoun == null) {
      final id = await db.into(db.pronouns).insert(PronounsCompanion(
            value: Value(name),
          ));
      return await (db.select(db.pronouns)
            ..where(
              (t) => t.id.equals(id),
            ))
          .getSingle();
    }

    return pronoun;
  }
}
