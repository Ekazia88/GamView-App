import 'package:flutter/material.dart';
import 'package:gamview/Widget/Card.dart';
import 'package:gamview/Widget/Discover/CardDiscover.dart';


import '../../Models/DataReview.dart';
import '../../Screen/Game_page.dart';

class SectItemSearch extends StatelessWidget {
  const SectItemSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dtr.length,
      itemBuilder: (context, index) {
        return CardDiscoverContainer(idx: index, title: dtr[index].namaGame, Genre: dtr[index].genre, platform: dtr[index].platform, released: dtr[index].tahunRilis, Rating: 22.2,onTap: () {
            Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return GamePage(Idx: index);
        })
      );
        },);
      },
    );
  }
}