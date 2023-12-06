import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Models/Category.dart';
import '../Models/DataGame.dart';
import 'gameProvider.dart';


class CategoryProvider with ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<CatModel> catlist = [
    
  ];
  final GameProvider _gameProvider = GameProvider();

  Future getCatData() async{
    List<CatModel> newcatlist = [];
      try {
      QuerySnapshot data = await firestore.collection("category").get();
      for (QueryDocumentSnapshot element in data.docs) {
        if (element.exists) {
          CatModel catModel = CatModel.fromJson(element.data());
          newcatlist.add(catModel);
        }
      }
      catlist = newcatlist;
      notifyListeners();
    } catch (error) {
      print("Error fetching category data: $error");
      // Handle the error as needed
    }
  }
Future<void> getGamesByCategory(String categoryId,String title) async {
    await _gameProvider.showGameByCat(categoryId);
  }
}