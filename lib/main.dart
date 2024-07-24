import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF474749),
        scaffoldBackgroundColor: Color(0xFF474749),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontFamily: 'Oswald', color: Color(0xFF474648)),
          bodyMedium: TextStyle(fontFamily: 'Oswald', color: Color(0xFFFFFFFF)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
