import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializeDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  return openDatabase(
    join(await getDatabasesPath(), "leieren.sqlite"),
    onCreate: (db, version) {
      db.execute("create table sections(id integer primary key, name text)");
      db.execute(
          "create table words(id integer primary key, value text, translation text, foreign key(section_id) references sections(id))");
      db.execute(
          "create table verbs(id integer primary key, value text, translation text, tense text, foreign key(section_id) references sections(id))");
      db.execute(
          "create table conjugaison(id integer primary key, value text, position integer, pronoun text, foreign key(verb_id) references verbs(id))");
      db.execute(
          "create table nouns(id integer primary key, value text, translation text, gender char, plural text, foreign key(section_id) references sections(id))");
    },
    version: 1,
  );
}

class SQliteService {
  final Database database;

  SQliteService(this.database);
}
