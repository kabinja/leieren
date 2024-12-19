import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leieren/repository/course_respository.dart';
import 'package:leieren/repository/noun_repository.dart';
import 'package:leieren/repository/word_repository.dart';
import 'dart:io';
import 'package:mockito/annotations.dart';
import 'package:leieren/command/setup_command.dart';
import 'package:leieren/model/db/database.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'setup_command_test.mocks.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

@GenerateMocks([http.Client])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase db;

  FlutterError.demangleStackTrace = (StackTrace stack) {
    // Trace and Chain are classes in package:stack_trace
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  setUp(() {
    db = AppDatabase(DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ));
  });

  tearDown(() async {
    // await db.close();
  });

  testWidgets('setup command test', (t) async {
    await t.runAsync(() async {
      final client = MockClient();
      final json = File('test/fixtures/app.json').readAsStringSync();
      final url =
          "https://raw.githubusercontent.com/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";
      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(json, 200));

      await db.initialize();
      await SetupCommand(db, client).loadData();
      expect(
          await CourseRespository(db).getByName("INL"),
          Course(
            id: 1,
            name: "INL",
            level: "A1",
            language: "Lëtzebuergesch",
          ));

      final word = await WordRepository(db).findById(1);
      expect("where", word!.translation);
      expect(1, word.id);
      expect(0, word.correctCount);
      expect(0, word.wrongCount);

      final fro = await NounRepository(db).findById(2);
      expect("Fro", fro!.value);
      expect("Froen", fro.plural);
      expect("F", fro.gender);

      final land = await NounRepository(db).findById(3);
      expect("Land", land!.value);
      expect("Länner", land.plural);
      expect("N", land.gender);
    });
  });
}
