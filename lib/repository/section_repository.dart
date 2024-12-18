import 'package:drift/drift.dart';
import 'package:leieren/model/db/database.dart';

class SectionRepository {
  final AppDatabase db;

  SectionRepository(this.db);

  Future<Section?> getByName(int courseId, String name) async {
    return (db.select(db.sections)
          ..where((t) => t.course.equals(courseId) & t.name.equals(name)))
        .getSingleOrNull();
  }

  Future<Section> createOrUpdate({
    required int courseId,
    required String name,
    required int number,
  }) async {
    final section = await getByName(courseId, name);
    if (section == null) {
      final id = await db.into(db.sections).insert(SectionsCompanion(
            name: Value(name),
            number: Value(number),
            course: Value(courseId),
          ));
      return await (db.select(db.sections)
            ..where(
              (t) => t.id.equals(id),
            ))
          .getSingle();
    }
    await db.update(db.sections)
      ..where((t) => t.id.equals(section.id));
    return await (db.select(db.sections)
          ..where(
            (t) => t.id.equals(section.id),
          ))
        .getSingle();
  }
}
