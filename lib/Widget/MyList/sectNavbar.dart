import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectMylist extends StatelessWidget {
  const SectMylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blue,
      child:
      Padding(
        padding : EdgeInsets.all(10),
      child:
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Finish",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21,
          ),
          ),
          Text("Finish",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21,
          ),
          ),Text("Finish",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21,
          ),
          ),
          Text("Finish",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21,
          ),
          ),
          Text("Finish",style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 21,
          ),
          ),
        ],
      ),
      )
    );
  }
}
