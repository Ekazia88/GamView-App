import 'package:flutter/material.dart';
import 'package:gamview/Widget/MyList/sectNavbar.dart';


import '../Widget/MyList/SectItem.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        SectMylist(),
        Expanded(child: 
        SectItem(),
        )
      ],
    );
  }
}