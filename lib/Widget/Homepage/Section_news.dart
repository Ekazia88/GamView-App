

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Widget/Homepage/card.dart';

class SectNews extends StatelessWidget {
  const SectNews({super.key});

  @override
   
  Widget build(BuildContext context) {
     var lebar = MediaQuery.of(context).size.width;
      var tinggi = MediaQuery.of(context).size.height;
      return  Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.amber,
                width: lebar,
                height: tinggi / 3.5,
                child:Column(
                    children: [
                Center( 
                  child:
                  Text(
                    "Latest News", 
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Expanded(
                  child:
                    ListView(
                  children: <Widget>[
                    SizedBox(height: 10),
                    CarouselSlider(items:[
                      CardNews(),
                      CardNews2(),
                      CardNews3()
                     
                    ], 
                    options:
                      CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800), 
                        viewportFraction: 0.8,
                
                        )
                        ),
                  ],
                )
                )
                ]
                ) 
                );
  }
}