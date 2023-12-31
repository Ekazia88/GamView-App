import 'package:gamview/Models/Platform.dart';



class MyList {
  String idGame;
  String name;
  String Released;
  String imageurl;
  int ratingUsers;
  int ProgressGame;
  String Status;
  List<String> listplatform;

  MyList({
    required this.idGame,
    required this.name,
    required this.Released,
    required this.imageurl,
    required this.ratingUsers,
    required this.ProgressGame,
    required this.Status,
    required this.listplatform,
  });

  factory MyList.fromJson(Map<String, dynamic> json) {
    List<String> platList = [];
    if (json['listplatform'] != null) {
      for (var plat in json['listplatform']) {
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
      Status: json['status'] ?? '',
      listplatform: platList,
    );
  }
}