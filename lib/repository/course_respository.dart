import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';

class CourseRespository {
  final AppDatabase db;

  CourseRespository(this.db);

  Future<Course?> getByName(String name) async {
    return (db.select(db.courses)..where((t) => t.name.equals(name)))
        .getSingleOrNull();
  }

  Future<Course> createOrUpdate({
    required String name,
    required String level,
    required String language,
  }) async {
    final course = await getByName(name);
    if (course == null) {
      final id = await db.into(db.courses).insert(CoursesCompanion(
            name: Value(name),
            level: Value(level),
            language: Value(language),
          ));
      return await (db.select(db.courses)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .getSingle();
    }
    await db.update(db.courses)
      ..where((t) => t.id.equals(course.id));
    return await (db.select(db.courses)
          ..where(
            (t) => t.id.equals(course.id),
          ))
        .getSingle();
  }
}
