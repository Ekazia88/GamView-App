import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Screen/Game_page.dart';
import 'package:gamview/Widget/Homepage/Section_news.dart';
import 'package:gamview/Widget/Navigation.dart';
import 'package:gamview/Widget/Homepage/card.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer :NavigationWid(),
        appBar: AppBar(
          centerTitle: true,
        title: Text('GamView'),
        ),
        body: Center(
              child : Column(
                children: [
               SectNews(),
              Expanded(child:
                Padding(padding: EdgeInsets.all(10),
                  child: listReview.isEmpty ?
                    Text("Yah ngak ada review!!" ,style: TextStyle(
                      fontSize: 35,
                      color:  Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black
                    ))
                    :
                  Column(
                    children: [
                      Text("Review Hari Ini", style: Theme.of(context).textTheme.bodyLarge,),
                    Expanded(child: listCardriview()),
                    ],
                  )
                  ,
                  ),
              )
                ] 
                ),
        )
            );
    }
}