import 'package:flutter/material.dart';

import '../app/factories/factories.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeApp',
      home: makeLoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.blue),
    );
  }
}
