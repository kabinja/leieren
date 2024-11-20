import 'package:leieren/model/app_model.dart';
import 'package:leieren/model/word_model.dart';
import 'package:leieren/service/json_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

late BuildContext _mainContext;
void init(BuildContext c) {
  _mainContext = c;
}

class BaseCommand {
  AppModel appModel = _mainContext.read();
  WordListModel wordListModel = _mainContext.read();

  JsonService jsonService = _mainContext.read();
}
