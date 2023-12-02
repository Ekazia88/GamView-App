import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class GameProvider extends ChangeNotifier {
  late List<String> _categories;

  List<String> get categories => _categories;

  set categories(List<String> value) {
    _categories = value;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      final value = await FirebaseFirestore.instance.collection("Game").doc("Category").get();
      categories = List<String>.from(value.data()?["Name"] ?? []);
    } catch (error) {
      print("Error fetching categories: $error");
    }
  }
}