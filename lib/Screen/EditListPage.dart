import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';

class EditListPage extends StatelessWidget {
  const EditListPage({super.key, required this.idx});

  @override
  final int idx;
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(padding: EdgeInsets.only(left: 25),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(

          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child:
            IconButton(
              icon: Icon(Icons.close_rounded)
            ,
            iconSize: 30, onPressed: (){},),
            ),
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
        ),)
      ],
      )
      )
    );
  }
}