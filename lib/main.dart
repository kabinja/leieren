import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'command/base_command.dart' as Commands;
import 'view/page/card_stack_page.dart';
import 'service/word_service.dart';

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