import 'package:flutter/material.dart';
import 'package:leieren/model/app_model.dart';
import 'package:leieren/model/word_model.dart';
import 'package:leieren/view/page/home_page.dart';
import 'package:leieren/view/page/navigation.dart';
import 'package:provider/provider.dart';

import 'package:leieren/command/base_command.dart' as Commands;
import 'package:leieren/service/word_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => WordListModel()),
        ChangeNotifierProvider(create: (c) => AppModel()),
        Provider(create: (c) => WordService()),
      ],
      child: Builder(builder: (context) {
        Commands.init(context);
        return MaterialApp(home: AppScaffold());
      }),
    );
  }
}

class AppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}