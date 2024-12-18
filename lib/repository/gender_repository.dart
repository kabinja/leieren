import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';

enum GenderEnum {
  feminin("F"),
  masculin("M"),
  neutral("N"),
  pleural("PL");

  const GenderEnum(this.value);
  final String value;
}

class GenderRepository {
  final AppDatabase db;

  GenderRepository(this.db);

  Future<Gender> get(String gender) async {
    return await (db.select(db.genders)
          ..where(
            (t) => t.short.equals(gender),
          ))
        .getSingle();
  }

  Future<void> initialize() async {
    await Future.forEach(GenderEnum.values, (t) async {
      await _createIfNotExists(t);
    });
  }

  Future<void> _createIfNotExists(GenderEnum genderEnum) async {
    final gender = await (db.select(db.genders)
          ..where(
            (t) => t.name.equals(genderEnum.name),
          ))
        .getSingleOrNull();

    if (gender == null) {
      await db.into(db.genders).insert(GendersCompanion(
            name: Value(genderEnum.name),
            short: Value(genderEnum.value),
          ));
    }
  }
}
