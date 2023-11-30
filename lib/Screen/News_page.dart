import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Screen/DetailGamePage.dart';
import 'package:gamview/Widget/News/NewsCard.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dtr.length,
      itemBuilder: (context,index)=> CardNewsContainer(Desc: dtr[index].Review, Title: dtr[index].namaGame, image: dtr[index].imagepath, idx: index, onTap: () {
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return DetailNewsPage(idx: index,);
        })
      );
      },),
    );
  }
}