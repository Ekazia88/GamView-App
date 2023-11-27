import 'package:flutter/material.dart';
import 'package:gamview/Widget/RoundedImageTextBtn.dart';

class SectionCategoryList extends StatelessWidget {
  const SectionCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_,index){
          return RoundedImageTextBtn(image: "assets/Images/GTA 6.jpg", title: "RPG", TextColor: Colors.black);
        }
        ),
    );
  }
}