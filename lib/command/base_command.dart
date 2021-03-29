import 'package:leieren_flutter/service/word_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

BuildContext _mainContext;
void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  WordService wordService = _mainContext.read();
}