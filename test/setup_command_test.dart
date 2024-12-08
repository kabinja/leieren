import 'package:flutter_test/flutter_test.dart';

import 'package:leieren/command/setup_command.dart';
import 'package:leieren/service/json_service.dart';

void main() {
  test('setup command test', () {
    final JsonService jsonService = JsonService();
    SetupCommand().loadData(jsonService);
  });
}
