
// Games _$GamesFromJson(Map<String, dynamic> json) {
//   return Games(
//     json['id'] as int,
//     json['name'] as String,
//     json['background_image'] as String,
//     json['metacritic'] as int,
//     (json['parent_platforms'] as List)
//         ?.map((e) => e == null
//             ? null
//             : ParentPlatform.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     json['released'] as String,
//     (json['genres'] as List)
//         ?.map((e) =>
//             e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     (json['short_screenshots'] as List)
//         ?.map((e) => e == null
//             ? null
//             : ShortScreenShots.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     (json['ratings'] as List)
//         ?.map((e) =>
//             e == null ? null : Ratings.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     json['ratings_count'] as int,
//     json['description'] as String,
//     json['description_raw'] as String,
//   );
// }

// Map<String, dynamic> _$GamesToJson(Games instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'background_image': instance.backgroundImage,
//       'metacritic': instance.metacritic,
//       'released': instance.released,
//       'parent_platforms': instance.parentPlatform,
//       'genres': instance.genres,
//       'short_screenshots': instance.shortScreenshots,
//       'ratings': instance.ratings,
//       'ratings_count': instance.ratingsCount,
//       'description': instance.description,
//       'description_raw': instance.descriptionRaw,
//     };

import 'package:gamview/Models/Category.dart';
import 'package:gamview/Models/Platform.dart';

class GameModel {
  String idGame;
  String name;
  String Released;
  String Sinopsis;
  int Rating;
  String image;
  List<CatModel> listcat;
  List<platformModel> listplat;

  GameModel({
    required this.idGame,
    required this.name,
    required this.Released,
    required this.Sinopsis,
    required this.Rating,
    required this.image,
    required this.listcat,
    required this.listplat,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    // Handle null checks and create instances of CatModel and PlatformModel here
    List<CatModel> catList = [];
    if (json['listcat'] != null) {
      for (var cat in json['listcat']) {
        catList.add(CatModel.fromJson(cat));
      }
    }

    List<platformModel> platList = [];
    if (json['listplat'] != null) {
      for (var plat in json['listplat']) {
        platList.add(platformModel.fromJson(plat));
      }
    }

    return GameModel(
      idGame: json['idGame'] ?? '',
      name: json['Name'] ?? '',
      Released: json['Released'] ?? '',
      Sinopsis: json['Sipnosis'] ?? '',
      Rating: json['Rating'] ?? 0,
      image: json['image'] ?? '',
      listcat: catList,
      listplat: platList,
    );
  }
}

