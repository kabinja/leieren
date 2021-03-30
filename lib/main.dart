import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:leieren/command/base_command.dart' as Commands;
import 'package:leieren/view/page/card_stack_page.dart';
import 'package:leieren/service/word_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
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
      body: CardStackPage(),
    );
  }
}