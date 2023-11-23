import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Widget/Homepage/card.dart';

class SectRiview extends StatelessWidget {
  const SectRiview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
                Padding(padding: EdgeInsets.all(10),
                  child: listReview.isEmpty ?
                    Text("Yah ngak ada review!!" ,style: TextStyle(
                      fontSize: 35,
                      color:  Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black
                    ))
                    :listCardriview(),
                  ),
                  );
  }
}