import 'package:leieren/model/content_model.dart';
import 'package:leieren/service/json_service.dart';
import 'package:leieren/service/word_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

late BuildContext _mainContext;
void init(BuildContext c) {
  _mainContext = c;
}

class BaseCommand {
  Content contentModel = _mainContext.read();

  JsonService jsonService = _mainContext.read();
  WordService wordService = _mainContext.read();
}
