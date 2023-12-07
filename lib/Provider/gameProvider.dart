import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/Category.dart';
import 'package:gamview/Models/Platform.dart';
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
  late platformModel modelplatform;
  late CatModel modelcat;
  GameModel game = GameModel(
    idGame: '1',
    name: 'Example Game',
    Released: '2023-01-01',
    Sinopsis: 'A great game!',
    Rating: 5,
    image: 'example.jpg',
    listcat: [
      CatModel( name: 'rpg', CatId: 'Cat04', Catimage: 'https://firebasestorage.googleapis.com/v0/b/gamview-a3859.appspot.com/o/category%2Frpg.png?alt=media&token=42b805c8-ec83-43aa-909c-3ed5daa9a9e8'),
      CatModel( name: 'rts', CatId: 'Cat05', Catimage: 'https://firebasestorage.googleapis.com/v0/b/gamview-a3859.appspot.com/o/category%2Frpg.png?alt=media&token=42b805c8-ec83-43aa-909c-3ed5daa9a9e8'),
    ],
    listplat: [
      platformModel( name: 'PC', Idplat: 'plat02', image: 'https://firebasestorage.googleapis.com/v0/b/gamview-a3859.appspot.com/o/platform%2Fplaystation.png?alt=media&token=cffacbaf-772d-4dea-8bd5-bb5b3d126c0a'),
      platformModel(name: 'Xbox', image: 'https://firebasestorage.googleapis.com/v0/b/gamview-a3859.appspot.com/o/platform%2Fxbox.png?alt=media&token=98439b06-3f77-4d54-bc3e-26080507dad5', Idplat: 'plat03'),
    ],
  );
  Future<void> storedata()async {
    Map<String, dynamic> gameMap = game.toJson();
    await _firestore.collection('Games').doc().set(gameMap);
  } 
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
