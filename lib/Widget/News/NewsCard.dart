import 'package:flutter/material.dart';

class CardNewsContainer extends StatelessWidget {
  final String Title;
  final String Desc;
  final String image;
  final void Function()? onTap;
  final int idx;
  const CardNewsContainer({super.key, required this.Title, required this.Desc, required this.image, this.onTap, required this.idx});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child:Padding(padding: EdgeInsets.all(10),
      child:
      Container(
        padding: EdgeInsets.symmetric(horizontal: 70),
        width: 120,
        height: 250,
        child:Column(children: [ 
            Container(
              height: 150,
            
            decoration: BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitHeight 
                  ),
            ),
          ),
          Container(
            height: 80,
            width: 260,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
            ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
              Text("1233554dfdgfhhgjfgjhfghlgf",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Text("16m ago",style: Theme.of(context).textTheme.bodySmall,)
            ]),
          )
          )
        ]),
            // Padding(
            //   padding: EdgeInsets.only(left: 10,top: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(Title, 
            //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //         color: Colors.white,
            //         ),
            //       ),
            //       Text(
            //        Desc,
            //        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //         color: Colors.white,
            //         fontSize: 14
            //        ), 
            //       )

            //   ]
            //   ),
            //   )
      ),
      ),
    );
  }
}