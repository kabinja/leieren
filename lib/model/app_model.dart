import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier{
  int _level = 1;

  int get level => _level;

  set level(int level){
    _level = level;
    notifyListeners();
  }
}