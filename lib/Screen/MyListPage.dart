import 'package:flutter/material.dart';
import 'package:gamview/Widget/Homepage/card.dart';
import 'package:gamview/Widget/MyList/SectItem.dart';
import 'package:gamview/Widget/MyList/sectNavbar.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectMylist(),
        Expanded(child: 
        SectItem(),
        )
      ],
    );
  }
}