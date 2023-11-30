import 'package:flutter/material.dart';

class ItemBtn extends StatelessWidget {
  final String title;
  final Color clr;
 final void Function()? onTap;
  const ItemBtn({super.key, required this.title, required this.clr, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Container(
        width: 100,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(color: clr)
        ),
        child: Center(child: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: clr,
          fontSize: 10,
        ),
        )
        ),
      )
    );
  }
}