import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';

enum TypeEnum { word, verb, noun, expression }

class WordTypeRepository {
  final AppDatabase db;

  WordTypeRepository(this.db);

  Future<WordType> get(TypeEnum type) async {
    return await (db.select(db.wordTypes)
          ..where(
            (t) => t.name.equals(type.name),
          ))
        .getSingle();
  }

  Future<void> initialize() async {
    await Future.forEach(TypeEnum.values, (t) async {
      await _createIfNotExists(t);
    });
  }

  Future<void> _createIfNotExists(TypeEnum typeEnum) async {
    final type = await (db.select(db.wordTypes)
          ..where(
            (t) => t.name.equals(typeEnum.name),
          ))
        .getSingleOrNull();

    if (type == null) {
      await db.into(db.wordTypes).insert(WordTypesCompanion(
            name: Value(typeEnum.name),
          ));
    }
  }
}
