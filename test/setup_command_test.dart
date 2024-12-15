import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:mockito/annotations.dart';
import 'package:leieren/command/setup_command.dart';
import 'package:leieren/model/drift/database.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'setup_command_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ));
  });

  tearDown(() async {
    await db.close();
  });

  testWidgets('setup command test', (t) async {
    await t.runAsync(() async {
      final client = MockClient();
      final json = File('test/fixtures/app.json').readAsStringSync();
      final url =
          "https://raw.githubusercontent.com/kabinja/leieren/refs/heads/master/content/letzebuergesch-a1.json";
      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(json, 200));

      await SetupCommand(db, client).loadData();
      expect(
          await db.getCourseByName("INL"),
          Course(
            id: 1,
            name: "INL",
            level: "A1",
            language: "Lëtzebuergesch",
          ));
    });
  });
}
