import 'package:flutter/material.dart';

import './pages/root.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildDarkTheme(),
      home: RootPage(),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      // Define the default Brightness and Colors
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900],
      backgroundColor: Colors.blueGrey[700],
      accentColor: Colors.lightBlue[800],


      // Define the default Font Family
      fontFamily: 'Montserrat',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
