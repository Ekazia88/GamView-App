import 'package:flutter/material.dart';
import 'package:gamview/Provider/catProvider.dart';
import 'package:gamview/Widget/BottomNavbar.dart';
import 'package:gamview/Widget/Category/Section_Card.dart';
import 'package:gamview/Widget/Category/Section_Category_list.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';
import 'package:gamview/Widget/Navigation.dart';
import 'package:provider/provider.dart';

import '../Provider/gameProvider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 12,),
            SectionCategoryList(),
            SizedBox(height: 10,),
            Expanded(
              child: SectionCategoryCard(),
            ),
          ],
        ),
      );
  }
}
class SectionCat extends StatelessWidget {
  const SectionCat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_,index){
          return Column(
    children: [

    ],
          );
        }
        ),
    );
  }
}