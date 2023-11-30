import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Widget/MyList/ItemButton.dart';
import 'package:gamview/Widget/MyList/NumPick.dart';
import 'package:numberpicker/numberpicker.dart';

class EditListPage extends StatelessWidget {
  const EditListPage({super.key, required this.idx});

  @override
  final int idx;
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(padding: EdgeInsets.only(left: 24),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.close_rounded),
            iconSize: 30, onPressed: (){
              Navigator.pop(context);
            },),
            Spacer(),
            TextButton(onPressed: (){}, 
            child: Text("Save", style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.lightBlue,
            ),),
           
            )
          ],
        ),
        Text(dtr[idx].namaGame,style: Theme.of(context).textTheme.bodyMedium,),
        Text("Status", style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.grey
        ),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemBtn(title: "Onprogress", clr: Colors.white60),
            ItemBtn(title: "Finish", clr: Colors.blue),
            ItemBtn(title: "WishList", clr: Colors.brown),
        ],),
        SizedBox(height: 10,),
        Text("Rating",style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.grey
        ),),
        Numpick(),
        Text("Progress",style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.grey
        ),),
        Numpick(),
      ],
      )
      )
    );
  }
}