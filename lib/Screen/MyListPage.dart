import 'package:flutter/material.dart';
import 'package:gamview/Provider/MyListProvider.dart';
import 'package:gamview/Provider/gameProvider.dart';
import 'package:gamview/Provider/usersProvider.dart';
import 'package:gamview/Widget/Homepage/card.dart';
import 'package:gamview/Widget/MyList/sectNavbar.dart';
import 'package:provider/provider.dart';

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