import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Provider/MyListProvider.dart';
import 'package:gamview/Provider/gameProvider.dart';
import 'package:provider/provider.dart';

class SectMylist extends StatelessWidget {
  const SectMylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = context.watch<GameProvider>();
    MyListProvider myListProvider = context.watch<MyListProvider>();
    return Container(
      height: 60,
      color: Colors.blue,
      child:
      Padding(
        padding : EdgeInsets.all(10),
      child:
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(
          onPressed: () {
            myListProvider.setStatus("Finish");
          }, child: Text(
            "Finished",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21
            ),
          ),
          ),
          TextButton(
          onPressed: () {
            myListProvider.setStatus("Onprogress");
          }, child: Text(
            "OnProgress",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21
            ),
          ),
          ),
          TextButton(
          onPressed: () {
            myListProvider.setStatus("WishList");
          }, child: Text(
            "WishList",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 22
            ),
          ),
          ),
          TextButton(
          onPressed: () {
            myListProvider.setStatus("Favorited");
          }, child: Text(
            "Favorited",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21
            ),
          ),
          ),
        ],
      ),
      )
    );
  }
}
