import 'package:flutter/material.dart';
import 'package:gamview/Service/auth_service.dart';
import '../Widget/Navigation.dart';
import 'package:intl/intl.dart';

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

class AddNewsForm extends StatefulWidget {
  const AddNewsForm({Key? key}) : super(key: key);

  @override
  State<AddNewsForm> createState() => _AddNewsFormState();
}

class _AddNewsFormState extends State<AddNewsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final TextEditingController contentController = TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );

  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  void addNews(BuildContext context) {
    String title = titleController.text.trim();
    String image = imageController.text.trim();
    String date = DateFormat('yyyy-MM-dd').format(selectedDate);
    String content = contentController.text.trim();

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
              _buildDateField("Date"),
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

  Widget _buildDateField(String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              // onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                      text: DateFormat('yyyy-MM-dd').format(selectedDate)),
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.calendar_today),
          //   onPressed: () => _selectDate(context),
          // ),
        ],
      ),
    );
  }
}
