import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/Category.dart';

import '../Models/DataGame.dart';

class GameProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<GameModel> gamelist = [];
  String id = "cat05";
  String _title = "";
  String get title => _title;
  String get gameid => id;
  final List<CatModel> catlist =[]; 
  Future<void> showGameByCat(String catId) async {
    List<GameModel> newGameList = [];
    try {
      QuerySnapshot data = await _firestore.collection('Games').where("listcat").get();
      print(data.size);
      for (QueryDocumentSnapshot element in data.docs) {
        if (element.exists) {
          print("yes");
          GameModel gameModel =
              GameModel.fromJson(element.data() as Map<String, dynamic> ?? {});
          newGameList.add(gameModel);
        }else{
          print("no");
          throw Exception("No Data");
        }
      }
  
      gamelist = newGameList;
      notifyListeners();
    } catch (error) {
      print("Error fetching games: $error");
      // Handle error as needed
    }
  }


  void setTitle(String title, String gameId) {
    
    id = gameId;
    _title = title;
    notifyListeners();
  }
}
