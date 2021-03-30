import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:leieren/service/word_service.dart';

BuildContext _mainContext;
void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  WordService wordService = _mainContext.read();
}