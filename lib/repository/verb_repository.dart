import 'package:leieren/model/db/database.dart';

class Verb {
  final Word _word;

  Verb(this._word);
}

class VerbRepository {
  final AppDatabase db;

  VerbRepository(this.db);
}
