// membuat class dan list untuk menyimpan data
class dataReview{
  String namaGame;
  String platform ;
  String tahunRilis ;
  int Score ;
  String Review ;
  String genre ;
  String imagepath;
  dataReview({
    required this.namaGame,
    required this.platform,
    required this.tahunRilis,
    required this.Score,
    required this.Review,
    required this.genre,
    required this.imagepath
  });
}
List <dataReview> listReview = List.empty(growable: true);
class test{
  String Genre;
  String Title;
  String ImagePath;
  test({
    required this.Genre,
    required this.Title,
    required this.ImagePath
  });
}
List <test> lstT = [
  test(Genre: "123",Title: "123",ImagePath: "assets/Images/GTA 6.jpg"),
  test(Genre: "123",Title: "123",ImagePath: "assets/Images/GTA 6.jpg"),
  test(Genre: "123",Title: "123",ImagePath: "assets/Images/GTA 6.jpg"),
  test(Genre: "123",Title: "123",ImagePath: "assets/Images/GTA 6.jpg")
];
List <dataReview> dtr = [
  dataReview(namaGame: "Hogwart Legacy", platform: "Playstation,Switch,PC,Xbox", tahunRilis: "2003", Score: 8, Review: "12345", genre: "1234", imagepath: "assets/Images/Howard_legacy_news.jpg"),
  dataReview(namaGame: "test1", platform: "test2", tahunRilis: "2003", Score: 8, Review: "12345", genre: "1234", imagepath: "assets/Images/Howard_legacy_news.jpg"),
  dataReview(namaGame: "test1", platform: "test2", tahunRilis: "2003", Score: 8, Review: "12345", genre: "1234", imagepath: "assets/Images/Howard_legacy_news.jpg"),
  dataReview(namaGame: "test1", platform: "test2", tahunRilis: "2003", Score: 8, Review: "12345", genre: "1234", imagepath: "assets/Images/Howard_legacy_news.jpg"),
];