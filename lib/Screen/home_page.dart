import 'package:flutter/material.dart';

import '../Widget/Homepage/IconProfile.dart';
import '../Widget/Homepage/Section_Riview.dart';
import '../Widget/Homepage/Section_news.dart';
import '../Widget/Navigation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ListView(  
       children: [
               SectNews(),
              SectRiview(),
                ], 
    );
  }
}