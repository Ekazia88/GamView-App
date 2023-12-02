import 'package:flutter/material.dart';
import '../Models/DataNews.dart'; // Replace with your actual path
import '../Widget/Navigation.dart'; // Replace with your actual path

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationWid(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your App Name"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: NewsList(),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNews.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listNews[index].title),
          subtitle: Text(listNews[index].date),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetails(news: listNews[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class NewsDetails extends StatelessWidget {
  final DataNews news;

  NewsDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(news.image),
            SizedBox(height: 16),
            Text("Date: ${news.date}"),
            SizedBox(height: 16),
            Text(news.content),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNewsForm(news: news),
                  ),
                );
              },
              child: Text("Edit"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete News'),
                      content:
                          Text('Are you sure you want to delete this news?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform delete operation here
                            listNews.remove(news);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNewsForm extends StatefulWidget {
  final DataNews news;

  EditNewsForm({required this.news});

  @override
  State<EditNewsForm> createState() => _EditNewsFormState();
}

class _EditNewsFormState extends State<EditNewsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.news.title;
    imageController.text = widget.news.image;
    dateController.text = widget.news.date;
    contentController.text = widget.news.content;
  }

  void updateNews(BuildContext context) {
    String title = titleController.text.trim();
    String image = imageController.text.trim();
    String date = dateController.text.trim();
    String content = contentController.text.trim();

    // Update the existing news
    widget.news.title = title;
    widget.news.image = image;
    widget.news.date = date;
    widget.news.content = content;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('News updated successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit News"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(titleController, "Title"),
              SizedBox(height: 16),
              _buildTextField(imageController, "Image URL"),
              SizedBox(height: 16),
              _buildTextField(dateController, "Date"),
              SizedBox(height: 16),
              _buildTextField(contentController, "Content"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  updateNews(context);
                },
                child: Text("Update News"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
