import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamview/Widget/Homepage/cardbox.dart';

import '../../Models/DataGame.dart';
import '../../Models/DataReview.dart';
import '../../Screen/Game_page.dart';
import '../circleNumber.dart';
<<<<<<< HEAD
=======

import 'package:http/http.dart' as http;

>>>>>>> fac2f2475e5d44f0a7d24a7c3907665032f6e6b8
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
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                SelectableText("GOTY 2023: ",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SelectableText("Nominasi Game Of the year Tahun ini",
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
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
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  SelectableText("GOTY 2024: ",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  SelectableText("Nominasi Game Of the year Tahun ini",
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ],
        ));
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
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                SelectableText("GTA 6 NEWS: ",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SelectableText("Trailer gta 6 muncul di akhir tahun",
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
        ],
      ),
    );
  }
}
//  class listCardriview extends StatefulWidget {
//     const listCardriview({super.key});

//   @override
//   State<listCardriview> createState() => _listCardriviewState();
// }

// class _listCardriviewState extends State<listCardriview> {
//  String APIKEY = '29fdecacf1544d789335eefbefb835e2';
//   String BASE_URL = 'https://api.rawg.io/api/games?token&key=29fdecacf1544d789335eefbefb835e2';
//   Future<List<Game>> _fetchGames() async {
//    final response = await http.get(Uri.parse(BASE_URL));
//   if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body) as List<dynamic>;
//       final games = jsonResponse.map((data) => Game.fromJson(data)).toList();
//       return games;
//   } else {
//     throw Exception('$response');
//   }
// }
//     @override

//     Widget build(BuildContext context) {
//       return FutureBuilder(
//   future: _fetchGames(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       final games = snapshot.data as List<Game>;
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: games.length,
//         itemBuilder: (context, index){
//           return
//           Cardbox(
//           idx: index,
//           title: games[index].name,
//           genre: games[index].name,
//           platform: games[index].platforms.first.name,
//           released: games[index].released,
//           rating: games[index].rating,
//         );
//         }
//       );
//     } else if (snapshot.hasError) {
//       print(snapshot.error);
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return CircularProgressIndicator();
//     }
//   },
// );
// }
// }