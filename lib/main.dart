import 'package:flutter/material.dart';
import 'package:gamview/Screen/Introduction_page.dart';
import 'package:gamview/Screen/about_page.dart';
import 'package:gamview/Screen/home_page.dart';
import 'package:gamview/Screen/input_GamView.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';




void main() {
  runApp(const MyApp());
}
// untuk membuat route antar halaman
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Introduction_page(),
        '/home':(context) => Homepage(),
        '/Add' : (context) => AddReviewscreen(),
        '/About' :(context) => AboutPage(),
      },
       theme: ThemeData(
        // Light Theme

        brightness: Brightness.light,
        primarySwatch: Colors.blue, 
        scaffoldBackgroundColor: Colors.white,

        // Konfigurasi teks
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 30, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 25, color: Colors.black),
          bodySmall: TextStyle(fontSize: 15,color: Colors.black)
        ),
        cardTheme: CardTheme(
          color: Colors.blueGrey
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
        )
      ),
      darkTheme: ThemeData(
        // Dark Theme
        brightness: Brightness.dark,
        primarySwatch: Colors.teal, 
        scaffoldBackgroundColor: Color(0xFF2B2B28), 

        // Konfigurasi teks untuk tema gelap
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 25, color: Colors.white),
          bodySmall: TextStyle(fontSize: 15,color: Colors.white)
        ),
        cardTheme: CardTheme(
          color: Colors.lightBlue
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal
        )
      ),
      themeMode: Provider.of(context).System,
    );
  }
}

