import 'package:flutter/material.dart';

class RoundedImageTextBtn extends StatelessWidget {
  final String image,title;
  final Color TextColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const RoundedImageTextBtn({super.key,
  required this.image, required this.title, required this.TextColor, this.backgroundColor, this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding : const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image(image: AssetImage(image), fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 6,),
          SizedBox(
            width: 55,
            
            child: Center(
              child: 
            Text(title,style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white
            ),
            ),
            ),
          )
        ]),
      ),
    );
  }
}