import 'package:flutter/material.dart';
import 'package:leieren/command/app_command.dart';
import 'package:leieren/model/app_model.dart';
import 'package:leieren/model/word_model.dart';
import 'package:leieren/service/json_service.dart';
import 'package:leieren/view/page/home_page.dart';
import 'package:provider/provider.dart';

import 'package:leieren/command/base_command.dart' as Commands;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => WordListModel()),
        ChangeNotifierProvider(create: (c) => AppModel()),
        Provider(create: (c) => JsonService()),
      ],
      child: Builder(builder: (context) {
        Commands.init(context);
        return MaterialApp(home: AppScaffold());
      }),
    );
  }
}

class RouteSplash extends StatefulWidget {
  @override
  _RouteSplashState createState() => _RouteSplashState();
}

class _RouteSplashState extends State<RouteSplash> {
  bool shouldProceed = false;

  _fetchConfiguration() async {
    await AppCommand().setup()
    setState(() {
      shouldProceed = true; //got the prefs; set to some value if needed
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchConfiguration(); //running initialisation code; getting prefs etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: shouldProceed
            ? AppScaffold()
            : CircularProgressIndicator(), //show splash screen here instead of progress indicator
      ),
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
