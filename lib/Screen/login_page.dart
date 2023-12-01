import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamview/Screen/Home_page.dart';
import 'package:gamview/Service/StorageData.dart';
import 'package:gamview/Service/auth_service.dart';
import 'package:gamview/Widget/ImagePicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import 'pageController.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool islogin = false;
  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  submit() async{
    String email = emailController.value.text;
    String password = passwordController.value.text;
    if(email.isEmpty || password.isEmpty){
      popup("warning", "kolom harus diisi!");
    }else{
      setState(() => islogin = true);
      try{
        await FirebaseAuthService().SignIn(email, password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> pagesController() ));
      }catch(e){
        setState(() => islogin = false);

        emailController.clear();
        passwordController.clear();
      }

    }
  }
  void popup(String title,String content){
    showDialog(context: context, builder: ((context) {
      return AlertDialog(
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge,),
        content: Text(content,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black
        ),),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.exit_to_app),)
        ],
      );
    })
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //   'assets/logo.png',
              //   width: screenWidth * 0.8,
              //   height: screenHeight * 0.2,
              // ),
              Text(
                'Welcome to My App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromARGB(255, 61, 52, 177),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      submit(); 
                      // if (emailController.text == 'novi@gmail.com' &&
                      //     passwordController.text == '1283') {
                      //   _showSnackbar('Login berhasil');
                      // } else {
                      //   _showSnackbar('Login gagal');
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text(
                  'Belum punya akun? Daftar di sini',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class RegistrationPage extends StatefulWidget {
  
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool islogin = false;
  Uint8List? _image;
  User? user;

  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void SelectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    }); 
  }
  void Submit() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String Date = DateTime.now().toString();
    StoreUsersData savedata = StoreUsersData();
   
    try{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('UsersDetail').where('username',isEqualTo: username).get();
      if(querySnapshot.docs.isNotEmpty){

      }else{
        var uuid = Uuid();
        String id = uuid.v4();
        await _auth.SignUp(email, password);
        String image = await savedata.uploadProfileImage(username, _image!);
        savedata.RegisterUsersDetail(Date, email, image, username, id);
        setState(() => islogin = true);
      }
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(17, 18, 20, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  _image != null ?
                    Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: MemoryImage(_image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: IconButton(
                      onPressed: (){
                        SelectImage();
                      },
                      icon :Icon(Icons.person,
                      size: 50.0,
                      color: Colors.grey[600],
                      )
                    ),
                  ):
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: IconButton(
                        onPressed:() {
                           SelectImage();
                        },
                        icon: Icon(Icons.add,
                        size: 20.0,
                        color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    prefixIcon: Icon(Icons.person_outline),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromARGB(255, 61, 52, 177),
                ),
                child: InkWell(
                  onTap: () {
                    print(islogin);
                    islogin != true ? Submit() : 
                    print(islogin);
                    Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return pagesController();
        })
      );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text(
                 'Sudah punya akun? Masuk di sini',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
