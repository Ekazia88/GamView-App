import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final String Title;
  final String Genre;
  final String ImagePath;
  final void Function()? onTap;
  final void Function ()? onPressed;
  final IconData? icon;
  const CardContainer({super.key, required this.Title, required this.Genre, required this.ImagePath, this.onTap, this.onPressed, this.icon,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Padding(padding: EdgeInsets.only(left: 10,right: 12,top: 24),
        child: 
        Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              ),
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children : [
              Stack(
                children: [
                  Container(
                    width: 200,
                    height:220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(ImagePath),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child:
                    Row(
                      children:[ 
                      Container(
                        width: 100,
                        height: 50,
                      ),
                      SizedBox(width: 45,),
                      Container(
                        width: 35,
                        height: 35,
                        child: Center(
                          child: 
                          IconButton(
                            onPressed: onPressed,
                            icon:Icon(
                            icon,
                            color: Colors.white,
                            size: 30,
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding:EdgeInsets.only(left: 12),
                child: Text(
                  Title, 
                  style: 
                  Theme.of(context).textTheme.bodyMedium?.
                  copyWith(
                    fontSize: 18
                    )
                  ),
              ),
              Padding(padding:EdgeInsets.only(left: 10),
              child: 
              Text(
                Genre,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black
                )
                ),
              ),
          ]),
      ),
        ),
    );
  }
}