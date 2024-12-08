import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Courses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get level => text()();
  TextColumn get language => text()();
}

class Sections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get number => integer()();
}

class WordTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Translations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get section => integer().references(Sections, #id)();
  IntColumn get type => integer().references(WordTypes, #id)();
  TextColumn get value => text()();
  TextColumn get specifier => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastCorrect => dateTime().nullable()();
  DateTimeColumn get lastWrong => dateTime().nullable()();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get translation => integer().references(Translations, #id)();
  TextColumn get value => text()();
}

class Pronouns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text()();
}

class Verbs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get translation => integer().references(Translations, #id)();
  TextColumn get value => text()();
  IntColumn get position => integer()();
  IntColumn get pronoun => integer().references(Pronouns, #id)();
}

class Gender extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text()();
}

class Nouns extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get translation => integer().references(Translations, #id)();
  TextColumn get value => text()();
  IntColumn get gender => integer().references(Translations, #id)();
  TextColumn get plural => text().nullable()();
}

@DriftDatabase(tables: [
  Courses,
  Sections,
  WordTypes,
  Translations,
  Words,
  Pronouns,
  Verbs,
  Gender,
  Nouns
])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'transaltions');
  }
}
