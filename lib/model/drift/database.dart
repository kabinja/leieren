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

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get section => integer().references(Sections, #id)();
  IntColumn get type => integer().references(WordTypes, #id)();
  TextColumn get translation => text()();
  TextColumn get value => text()();
  TextColumn get specifier => text()();
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

class Verbs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get word => integer().references(Words, #id)();
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
  IntColumn get word => integer().references(Words, #id)();
  TextColumn get value => text()();
  IntColumn get gender => integer().references(Gender, #id)();
  TextColumn get plural => text().nullable()();
}

@DriftDatabase(tables: [
  Courses,
  Sections,
  WordTypes,
  Words,
  Pronouns,
  Verbs,
  Gender,
  Nouns
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  factory AppDatabase.drift() {
    return AppDatabase(driftDatabase(name: 'transaltions'));
  }

  @override
  int get schemaVersion => 1;

  Future<Course?> getCourseByName(String name) async {
    return (select(courses)..where((t) => t.name.equals(name)))
        .getSingleOrNull();
  }

  Future<Course> createOrUpdateCourse({
    required String name,
    required String level,
    required String language,
  }) async {
    var course = await this.getCourseByName(name);
    if (course == null) {
      final id = await into(courses).insert(CoursesCompanion(
        name: Value(name),
        level: Value(level),
        language: Value(language),
      ));
      return await (select(courses)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .getSingle();
    }
    await update(courses)
      ..where((t) => t.id.equals(course.id));
    return await (select(courses)
          ..where(
            (tbl) => tbl.id.equals(course.id),
          ))
        .getSingle();
  }
}
