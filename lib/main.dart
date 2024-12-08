import 'package:flutter/material.dart';
import 'package:leieren/command/setup_command.dart';
import 'package:leieren/service/json_service.dart';
import 'package:leieren/view/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RouteSplash());
  }
}

class RouteSplash extends StatefulWidget {
  @override
  _RouteSplashState createState() => _RouteSplashState();
}

class _RouteSplashState extends State<RouteSplash> {
  bool shouldProceed = false;

  _fetchConfiguration() async {
    final JsonService jsonService = JsonService();
    SetupCommand().loadData(jsonService);
    setState(() {
      shouldProceed = true;
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
