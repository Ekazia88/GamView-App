import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/Category.dart';
import 'package:gamview/Models/UsersList.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import '../Models/DataGame.dart';

class GameProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<GameModel> gamelist = [];

  String _catId = "05"; // Store the selected category id
  String _title = "";

  String get title => _title;
  String get catId => _catId; // Getter for catId
  List<CatModel> catlist = [];

  Future<void> showGameByCat(String catId) async {
    List<GameModel> newGameList = [];

    try {
      QuerySnapshot data = await _firestore.collection('Games').get();
      for (QueryDocumentSnapshot element in data.docs) {
        if (element.exists) {
          Map<String, dynamic>? gameData =
              element.data() as Map<String, dynamic>?;

          if (gameData != null) {
            GameModel gameModel = GameModel.fromJson(gameData);
            bool catIdIsSpecified = gameModel.listcat.any(
              (cat) =>
                  cat is CatModel &&
                  cat.CatId != null &&
                  cat.CatId == catId,
            );

            if (catIdIsSpecified) {
              newGameList.add(gameModel);
            }
          } else {
            print("No 'listcat' field or not a List");
          }
        }
      }

      gamelist = newGameList;
      notifyListeners();
    } catch (error) {
      print("Error fetching games: $error");
      // Handle error as needed
    }
  }

  void setCategory(String catId, String title) {
    _catId = catId;
    _title = title;
    notifyListeners();
  }
}
