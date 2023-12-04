import 'package:gamview/Models/Platform.dart';

class MyList {
  String idGame;
  String name;
  String Released;
  String imageurl;
  int ratingUsers;
  int ProgressGame;
  List<String> listplatform;

  MyList({
    required this.idGame,
    required this.name,
    required this.Released,
    required this.imageurl,
    required this.ratingUsers,
    required this.ProgressGame,
    required this.listplatform,
  });

  factory MyList.fromJson(Map<String, dynamic> json) {
    List<String> platList = [];
    if (json['listplatform'] != null) {
      for (var plat in json['listplatform']) {
        // Assuming 'plat' is a string
        platList.add(plat as String);
      }
    }

    return MyList(
      idGame: json['idGame'] ?? '',
      name: json['name'] ?? '',
      Released: json['released'] ?? '',
      imageurl: json['imageurl'] ?? '',
      ratingUsers: json['ratingUsers'] ?? 0,
      ProgressGame: json['progressgame'] ?? 0,
      listplatform: platList,
    );
  }
}