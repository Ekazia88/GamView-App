import 'package:flutter/material.dart';

class IconProfile extends StatelessWidget {
 final double wdth;  
  final double hght;
  final String image;
  const IconProfile({super.key, required this.wdth, required this.hght, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: wdth,
      height: hght,
      child:
    CircleAvatar(
      backgroundImage: NetworkImage(image),
    )
    );
  }
}