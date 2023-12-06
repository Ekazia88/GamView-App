

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
   String downloadUrl = await snapshot.ref.getDownloadURL();
   return downloadUrl;
  }

Future<void> RegisterUsersDetail(String DateCreated, String Email, String imageurl,String username,String uuid) async{
  print("test");
  await _firestore.collection('UsersDetail').doc(uuid).set({
    'Uid' : uuid,
    'username' : username,
    'DateCreated' : DateCreated,
    'email' : Email,
    'imageurl' :imageurl,
  }).catchError((e){
    print(e);
  });
}
}