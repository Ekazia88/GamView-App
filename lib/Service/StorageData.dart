

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage =FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreUsersData{
  Future<String> uploadProfileImage(String childName, Uint8List file) async{

   Reference ref = _storage.ref().child(childName);
   UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
   String downloadUrl = await snapshot.ref.getDownloadURL()
  }
}
Future <String> saveDataUser({
  required String Uid,
  required String username,
  required String Email,
  required String password,
  required DateTime DateCreated,
  required Uint8List file,
}) async {
  String resp ="terjadi error";
  try{
    String imageurl = await uploadProfileImage("profileImage", file);
    await _firestore.collection('UsersDetail').add({
      'DateCreated': DateCreated,
      'Email' : Email,
      'Image' : imageurl,
      'Username' : username,
      'idUser': Uid,
      'password': password,

    });
  }catch(e){
    resp = e.toString();
  }
  return resp;
}