import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamview/Models/UsersDetail.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference users = FirebaseFirestore.instance.collection("DetailsUsers");
class Users{
  
  Future <UsersDetail> getID(String IdX)async {  
    users.doc(IdX).
  }
}