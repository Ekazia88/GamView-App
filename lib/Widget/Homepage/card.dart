import 'package:flutter/material.dart';

import '../../Models/DataReview.dart';
import '../../Screen/Game_page.dart';
class CardNews extends StatelessWidget {
  const CardNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjusted height for portrait orientation
      width: 300, // Adjusted width for portrait orientation
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                  image: AssetImage("assets/Images/Howard_legacy_news.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,), 
                SelectableText("GOTY 2023: ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )),
                SelectableText("Nominasi Game Of the year Tahun ini",style: TextStyle(
                  fontSize: 13,
                  color: Colors.white
                )),
              ],
            ),
            ),
            SizedBox(
              width: 320,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                ),
              ),
          ],
        ),
      );
  }
}
class CardNews2 extends StatelessWidget {
  const CardNews2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjusted height for portrait orientation
      width: 300, // Adjusted width for portrait orientation
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                  image: AssetImage("assets/Images/Howard_legacy_news.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,), 
                SelectableText("GOTY 2024: ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )),
                SelectableText("Nominasi Game Of the year Tahun ini",style: TextStyle(
                  fontSize: 13,
                  color: Colors.white
                )),
              ],
            ),
            ),
            SizedBox(
              width: 320,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                ),
              ),
          ],
        )
    );
  }
}
class CardNews3 extends StatelessWidget {
  const CardNews3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjusted height for portrait orientation
      width: 300, // Adjusted width for portrait orientation
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                  image: AssetImage("assets/Images/GTA 6.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,), 
                SelectableText("GTA 6 NEWS: ",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )),
                SelectableText("Trailer gta 6 muncul di akhir tahun",style: TextStyle(
                  fontSize: 13,
                  color: Colors.white
                )),
              ],
            ),
            ),
            SizedBox(
              width: 320,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                ),
              ),
          ],
        ),
    );
  }
}
 class listCardriview extends StatelessWidget {
    const listCardriview({super.key});

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: listReview.length,
        itemBuilder: (context, index) => CardBox(context, index),
      );
    }
  }
  //membuat widget CardBox untuk setiap Review
  Widget CardBox(BuildContext context, int index){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return GamePage(Idx: index);
        })
      );
    },
    child:
  Card(
          child:
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).cardTheme.color,
              ),
            child: Padding(
              padding: EdgeInsets.all(13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 180,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listReview[index].namaGame,
                                style: TextStyle(
                                  fontSize: 25,
                                   color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                              listReview[index].platform,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                    ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                listReview[index].tahunRilis,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                    ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                listReview[index].genre,
                                style: TextStyle(fontSize: 20,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                ),
                              ),
                            ],
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15), // Add padding here
                            child: CircleNumber(number:listReview[index].Score),
                          ),
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            )
  );
  }
//membuat CircleUntuk Score
  class CircleNumber extends StatelessWidget {
    final String number;

    CircleNumber({required this.number});
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 80, // Sesuaikan ukuran sesuai kebutuhan
        height: 80, // Sesuaikan ukuran sesuai kebutuhan
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).brightness == Brightness.dark
          ? Colors.teal // Ganti warna sesuai tema gelap
          : Colors.blue,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }