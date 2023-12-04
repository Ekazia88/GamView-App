  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';

  class GamePage extends StatelessWidget {
    final int Idx;
    const GamePage({super.key, required this.Idx});
    @override
    Widget build(BuildContext context) {
      var lebar = MediaQuery.of(context).size.width;
      var tinggi = MediaQuery.of(context).size.height;
      String score = dtr[Idx].Score.toString();
      print(dtr[Idx]);
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
          title: Text('GamView'),
          ),
        body: Container(
          width: lebar,
          height: tinggi,
          color: Colors.black,
          child:Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child:  
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: lebar/3,
                          height: tinggi/4,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Padding(padding: EdgeInsets.all(10),
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children :
                              [
                            Text(dtr[Idx].namaGame, 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(dtr[Idx].tahunRilis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(dtr[Idx].platform,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text("Score : "+ score,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            ],
                          ),
                        ),
                      ],
                    ), 
                ),
                Expanded(
                  child:
                    Padding(
                      padding: EdgeInsets.all(10),
                      child:
                        Container(
                          width: lebar,
                          height: tinggi,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.indigo,
                        ),
                        child:   Padding(padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              Text("Riview :",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries,but also the leap into electronic typesetting,remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                          ,style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                          ),
                          Expanded(child: ButtonCupertino())
                        ]),
                      )
                    )
                  )
                )
              ] 
            )
          ),
        );
    }
  }

  class ButtonCupertino extends StatefulWidget {
    const ButtonCupertino({super.key});

    @override
    State<ButtonCupertino> createState() => _ButtonCupertinoState();
  }
  void _showSuccessDialog(BuildContext context) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Pembelian Berhasil'),
            content: Text('Anda berhasil membeli produk.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
  }
  class _ButtonCupertinoState extends State<ButtonCupertino> {
    @override
    Widget build(BuildContext context) {
      return CupertinoButton(
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
          child: Align(alignment: Alignment.center,
          child : Text("Beli Game", style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
          ),
          )
        ),
        onPressed: () {  
          _showSuccessDialog(context);
        },
      );
    }
  }