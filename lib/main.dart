import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Screen/Introduction_page.dart';
import 'package:gamview/Screen/about_page.dart';
import 'package:gamview/Screen/pageController.dart';
import 'package:gamview/Screen/input_GamView.dart';
import 'package:gamview/Service/Service.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';




Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(MyApp());
}
// untuk membuat route antar halaman
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
     home: Introduction_page(),
       theme: ThemeData(
        // Light Theme

        brightness: Brightness.light,
        primarySwatch: Colors.blue, 
        scaffoldBackgroundColor: Color(0xFF171a21),

        // Konfigurasi teks
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 25, color: Colors.white),
          bodySmall: TextStyle(fontSize: 15,color: Colors.white)
           
        ),
        cardTheme: CardTheme(
          color: Color(0xFF008170)
          
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
    );
  }
}

