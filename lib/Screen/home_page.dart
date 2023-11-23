import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Screen/Game_page.dart';
import 'package:gamview/Widget/BottomNavbar.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';
import 'package:gamview/Widget/Homepage/Section_Riview.dart';
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
        leading: Builder(builder: (context) => IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: IconProfile(wdth: 50,hght: 50,)),
        )
        ),
        bottomNavigationBar: BottomNavbar(),
        body: ListView(
                children: [
               SectNews(),
              SectRiview(),
                ] 
                ),
        );
    }
}