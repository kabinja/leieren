import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:leieren/repository/gender_repository.dart';
import 'package:leieren/repository/word_type_repository.dart';

part 'database.g.dart';

class Courses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get level => text()();
  TextColumn get language => text()();
}

class Sections extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get course => integer().references(Courses, #id)();
  TextColumn get name => text()();
  IntColumn get number => integer()();
}

class WordTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get section => integer().references(Sections, #id)();
  IntColumn get type => integer().references(WordTypes, #id)();
  TextColumn get translation => text()();
  TextColumn get value => text()();
  TextColumn get specifier => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastCorrect => dateTime().nullable()();
  DateTimeColumn get lastWrong => dateTime().nullable()();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();
}

class Pronouns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text()();
}

class VerbExtras extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get word => integer().references(Words, #id)();
  TextColumn get value => text()();
  IntColumn get position => integer()();
  IntColumn get pronoun => integer().references(Pronouns, #id)();
}

class Genders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get short => text()();
}

class NounExtras extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get word => integer().references(Words, #id)();
  IntColumn get gender => integer().references(Genders, #id)();
  TextColumn get plural => text().nullable()();
}

@DriftDatabase(tables: [
  Courses,
  Sections,
  WordTypes,
  Words,
  Pronouns,
  VerbExtras,
  Genders,
  NounExtras
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  factory AppDatabase.drift() {
    return AppDatabase(driftDatabase(name: 'transaltions'));
  }

  Future<void> initialize() async {
    await WordTypeRepository(this).initialize();
    await GenderRepository(this).initialize();
  }

  @override
  int get schemaVersion => 1;
}
