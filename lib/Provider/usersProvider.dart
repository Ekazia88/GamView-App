import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import 'package:gamview/Service/StorageData.dart';

class UsersProviders extends ChangeNotifier {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  UsersDetail? _users;
  String? _uid;

  UsersDetail? get users => _users;
  String? get uid => _uid;

  Future<void> getUsers() async {
    _users = await Users().getID();
    _uid = _users?.Uid;
    notifyListeners();
  }
  
  Future<String?> GetUsersId() async{
     User? user = FirebaseAuth.instance.currentUser;
   QuerySnapshot query = await _firebase.collection("UsersDetail").get();
   for(QueryDocumentSnapshot snap in query.docs){
    if(snap.data() == users!.Uid){
      return snap.id;
    }
   }
  }

  Future<void> updateusers(Uint8List imagedata) async{
    StoreUsersData? storedata;
    String? docId = await GetUsersId();
    String NewUrlImage = await storedata!.uploadProfileImage(uid!, imagedata);
  }
  
  Future<void>updateImage(Uint8List imagedata) async {
    await storage.refFromURL(users!.imageurl).delete().then((_) async {
    });
  }
}
