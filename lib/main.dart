import 'package:flutter/material.dart';
import 'package:tasklist/scenes/home.dart';
import 'package:tasklist/scenes/main.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme(
          primaryVariant: Colors.deepPurple,
          secondaryVariant: Colors.deepPurple,
          secondary: Colors.deepPurple,
          surface: Colors.deepPurple,
          onPrimary: Colors.deepPurple,
          primary: Colors.deepPurple,
          onSurface: Colors.deepPurple,
          background: Colors.deepPurple,
          error: Colors.deepPurple,
          onBackground: Colors.deepPurple,
          onSecondary: Colors.deepPurple,
          onError: Colors.deepPurple,
          brightness: Brightness.light),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Main(),
      '/todo': (context) => Home(),
    },
  ));
}