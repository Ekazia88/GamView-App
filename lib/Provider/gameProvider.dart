import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamview/Models/DataGame.dart';
import 'package:http/http.dart' as http;

const String API_KEY = '246217f9f76246b68fd7882e47c1876f'; // Replace with your RAWG API key
const String BASE_URL = 'https://api.rawg.io/games';

Future<List<Game>> getGames() async {
  final response = await http.get(Uri.parse('$BASE_URL?key=$API_KEY'));

  if (response.statusCode == 200) {
    print(response);
    List <dynamic> jsonResponse = jsonDecode(response.body); 
      return jsonResponse.map((data) => Game.fromJson(data)).toList();
  } else {
    throw Exception(response);
  }
}