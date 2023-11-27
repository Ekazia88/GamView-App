// membuat class dan list untuk menyimpan data
class dataReview{
  String namaGame;
  String platform ;
  String tahunRilis ;
  String Score ;
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