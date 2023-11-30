import 'package:flutter/material.dart';
import 'package:gamview/Widget/Discover/sectitemSearch.dart';
import 'package:gamview/Widget/Discover/sectSearch.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectSearch(),
        Expanded(child: 
        SectItemSearch(),
        ),
      ],
    );
  }
}