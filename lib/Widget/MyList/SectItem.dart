import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Screen/EditListPage.dart';

import '../../Models/DataReview.dart';
import '../../Screen/Game_page.dart';

class SectItem extends StatelessWidget {
  const SectItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: dtr.length,
        itemBuilder: (context, index) => CardBoxList(context: context, TahunRilis: dtr[index].tahunRilis ,index: index, image: dtr[index].imagepath, title: dtr[index].namaGame, platform: dtr[index].platform, onTap: () { 
           Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return GamePage(Idx: index);
        })
      );
         }, ),
      );
    }
  }

class CardBoxList extends StatelessWidget {
  const CardBoxList({
    super.key,
    required this.context,
    required this.index,
    required this.image,
    required this.title,
    required this.platform,
    required this.onTap,
    required this.TahunRilis
  });

  final BuildContext context;
  final int index;
  final String image;
  final String title;
  final String platform;
  final String TahunRilis;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child:
      Card(
        child: Container(
          height: 120,
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill
                    ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10,top: 15),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    ),
                  ),
                   Text(platform,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.grey
                    ),
                  ),
                  Text(TahunRilis,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.grey
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.edit_document),
                      iconSize: 30,
                      onPressed: (){
                        Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return EditListPage(idx: index);
        })
      );
                      }),
                      IconButton(icon: Icon(Icons.delete_rounded),
                       iconSize: 30,
                      onPressed: (){
                      }),
                    ],
                  )
                ],
                )
              ),
            ],
          ),
        ),
      ),
      );
    }
}
