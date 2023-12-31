// import 'package:equatable/equatable.dart';
// import 'package:intl/intl.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'DataGame.dart';

// @JsonSerializable()
// class Games extends Equatable {
//   @JsonKey(name: 'id')
//   final int id;

//   @JsonKey(name: 'name')
//   final String name;

//   @JsonKey(name: 'background_image')
//   final String backgroundImage;

//   @JsonKey(name: 'metacritic')
//   final int metacritic;

//   @JsonKey(name: 'released')
//   final String released;

//   @JsonKey(name: 'parent_platforms')
//   final List<ParentPlatform> parentPlatform;

//   @JsonKey(name: 'genres')
//   final List<Genres> genres;

//   @JsonKey(name: 'short_screenshots')
//   final List<ShortScreenShots> shortScreenshots;

//   @JsonKey(name: 'ratings')
//   final List<Ratings> ratings;

//   @JsonKey(name: 'ratings_count')
//   final int ratingsCount;

//   @JsonKey(name: 'description')
//   final String description;

//   @JsonKey(name: 'description_raw')
//   final String descriptionRaw;

//   String getDate() {
//     String date = "";
//     if (released != null) {
//       DateFormat dateFormat = DateFormat('MMM dd, yyyy');
//       DateTime dateTime = DateTime.parse(released);
//       date = dateFormat.format(dateTime);
//     } else
//       date = "-";
//     return date;
//   }

//   Games(
//       this.id,
//       this.name,
//       this.backgroundImage,
//       this.metacritic,
//       this.parentPlatform,
//       this.released,
//       this.genres,
//       this.shortScreenshots,
//       this.ratings,
//       this.ratingsCount,
//       this.description,
//       this.descriptionRaw);

//   @override
//   List<Object> get props => [id, name, backgroundImage];

//   factory Games.fromJson(Map<String, dynamic> json) => _$GamesFromJson(json);

//   Map<String, dynamic> toJson() => _$GamesToJson(this);
// }