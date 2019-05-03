import 'package:cdonline/pages/BottomTabController.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildDarkTheme(),
      home: BottomTabController(),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      // Define the default Brightness and Colors
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900],
      backgroundColor: Colors.blueGrey[700],
      accentColor: Colors.lightBlue[800],
      hintColor: Colors.greenAccent[400],
      errorColor: Color(0xffff3131),
      bottomAppBarColor: Colors.blueGrey[900],
      cardColor: Colors.blueGrey[900],
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[900]),
      scaffoldBackgroundColor: Colors.blueGrey[700],
      
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
