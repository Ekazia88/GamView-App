class DataNews {
  late String title;
  late String image;
  late String date;
  late String content;

  DataNews({
    required this.title,
    required this.image,
    required this.date,
    required this.content,
  });
}

List<DataNews> listNews = [
  DataNews(
    title: "Flutter News App Released",
    image: "https://example.com/flutter_news.jpg",
    date: "2023-12-01",
    content:
        "Exciting news for Flutter developers! The new Flutter News App is now available...",
  ),
  DataNews(
    title: "Dart Language Update",
    image: "https://example.com/dart_update.jpg",
    date: "2023-11-30",
    content:
        "The latest Dart language update brings several new features and improvements...",
  ),
  // Add more sample news items as needed
];
