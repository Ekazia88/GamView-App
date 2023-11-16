import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Widget/Navigation.dart';



// membuat class untuk page tambahdata
class AddReviewscreen extends StatelessWidget {
  const AddReviewscreen({super.key});

  @override
    Widget build(BuildContext context){
    return Scaffold(
      drawer: NavigationWid(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("GamView"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TambahReview(),
      )
    );
    }
  }
  //membuat form untuk tambah data
  class TambahReview extends StatefulWidget {
  const TambahReview({Key? key}) : super(key: key);

  @override
  State<TambahReview> createState() => _TambahReviewState();
}

class _TambahReviewState extends State<TambahReview> {
  final TextEditingController namaGameController = TextEditingController();
  final TextEditingController platformController = TextEditingController();
  final TextEditingController tahunRilisController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();
  final TextEditingController riviewController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController imagepathController = TextEditingController();
  void addData(BuildContext context){
    String namaGame = namaGameController.text.trim();
    String platform = platformController.text.trim();
    String tahunRilis = tahunRilisController.text.trim();
    String score = scoreController.text.trim();
    String genre = genreController.text.trim();
    String Riview = riviewController.text.trim();
    String imagepath = imagepathController.text.trim();

    if(namaGame.isNotEmpty){
      listReview.add(dataReview(namaGame: namaGame, platform: platform, tahunRilis: tahunRilis, Score: score, Review: Riview, genre: genre, imagepath: imagepath));
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('data berhasil ditambahkan'),
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
        height: 320,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.indigo,
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Tambah Data", style: TextStyle(fontSize: 25,color: Colors.white)),
              ),
              SizedBox(height: 10),
              _buildTextFieldRow(
                  namaGameController, "Nama Game", platformController, "Platform"),
              SizedBox(height: 16),
              _buildTextFieldRow(
                  tahunRilisController, "Tahun Rilis", scoreController, "Score"),
              SizedBox(height: 16),
              _buildTextFieldRow(
                  riviewController, "Riview", imagepathController, "Nama Gambar"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  
                  addData(context);
                },
                child: Text("Tambah"),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildTextFieldRow(
    TextEditingController controller1,
    String label1,
    TextEditingController controller2,
    String label2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: _buildTextField(controller1, label1),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: _buildTextField(controller2, label2),
        ),
      ],
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
      )
      );
    }
  }
