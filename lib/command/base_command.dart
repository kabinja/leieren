import 'package:leieren/model/app_model.dart';
import 'package:leieren/model/word.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:leieren/service/word_service.dart';

BuildContext _mainContext;
void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  WordListModel wordListModel = _mainContext.read();
  AppModel appModel = _mainContext.read();

  WordService wordService = _mainContext.read();
}