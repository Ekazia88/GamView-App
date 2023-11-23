import 'package:flutter/material.dart';

class IconProfile extends StatelessWidget {
 final double wdth;  
  final double hght;

  const IconProfile({super.key, required this.wdth, required this.hght});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: wdth,
      height: hght,
      child:
    CircleAvatar(
      backgroundImage: AssetImage("assets/Images/GTA 6.jpg"),
    )
    );
  }
}