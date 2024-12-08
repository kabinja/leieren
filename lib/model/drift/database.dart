import 'package:drift/drift.dart';

class Course extends Table {
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

class WordType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Translation extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get section => integer().references(Sections, #id)();
  TextColumn get value => text()();
  TextColumn get specifier => text()();
  TextColumn get type => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastCorrect => dateTime().nullable()();
  DateTimeColumn get lastWrong => dateTime().nullable()();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();
}

class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get translation => integer().references(Translation, #id)();
  TextColumn get value => text()();
}

class Pronouns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text()();
}

class Verbs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get translation => integer().references(Translation, #id)();
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
  IntColumn get translation => integer().references(Translation, #id)();
  TextColumn get value => text()();
  IntColumn get gender => integer().references(Translation, #id)();
  TextColumn get plural => text().nullable()();
}
