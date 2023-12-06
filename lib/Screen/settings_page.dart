import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import 'package:gamview/Widget/ImagePicker.dart';
import 'package:image_picker/image_picker.dart';

import '../Service/auth_service.dart';
import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  final UsersDetail users;
  
  const SettingsPage({super.key, required this.users});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeEnabled = false;
  Uint8List? _image;
  
  void SelectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  
  @override
Widget build(BuildContext context) {
  final auth = FirebaseAuthService();
  return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text('Settings'),
      ),
      backgroundColor: Colors.blue,
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Stack(
            alignment: Alignment.center,
            children: [
              _image == null ?
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.users.imageurl)
              )
              : CircleAvatar(
                radius: 60,
                backgroundImage: MemoryImage(_image!),
              ),
              Positioned(
                left: 210,
                top: 75,
                child:
              Container(
                width: 45,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey
                ),
                child: IconButton(
                  onPressed: (){
                    SelectImage();
                  },
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                    ) ),
              )
              ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Row(
                children: [
                  Icon(
                    _darkModeEnabled
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8.0),
                  Text('Dark Mode'),
                ],
              ),
              Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _showEditProfileDialog(context);
            },
            child: Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
               auth.SignOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    ),
  );
}

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Text('Apakah Anda Yakin Ingin Mengubah Profile?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
