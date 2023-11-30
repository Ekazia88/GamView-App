import 'package:flutter/material.dart';
// import 'package:your_project_name/Models/DataNews.dart';
import '../Widget/Navigation.dart';

class AddNewsScreen extends StatelessWidget {
  const AddNewsScreen({Key? key}) : super(key: key);

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
        child: AddNewsForm(),
      ),
    );
  }
}

// Creating a form for adding news
class AddNewsForm extends StatefulWidget {
  const AddNewsForm({Key? key}) : super(key: key);

  @override
  State<AddNewsForm> createState() => _AddNewsFormState();
}

class _AddNewsFormState extends State<AddNewsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void addNews(BuildContext context) {
    String title = titleController.text.trim();
    String image = imageController.text.trim();
    String date = dateController.text.trim();
    String content = contentController.text.trim();

    // if (title.isNotEmpty) {
    //   listNews.add(DataNews(
    //     title: title,
    //     image: image,
    //     date: date,
    //     content: content,
    //   ));
    // }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('News added successfully'),
          actions: [
            TextButton(
              onPressed: () {
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.indigo,
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Add News",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
              SizedBox(height: 10),
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
                  addNews(context);
                },
                child: Text("Add News"),
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
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
