import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/DataGame.dart';
import '../Models/UsersList.dart';

class MyListProvider extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _title = "";
  String _status = "Onprogress";
  String get status => _status;
  String id = "";
  List <MyList> Lists = [];
  void setStatus(String status){
    _status=status;
    notifyListeners();
  }
 Future<void> GetUsersList(String uid, String status) async {
  List<MyList> newLists = [];
  CollectionReference UserList = _firestore.collection('UsersList');
  try {
    QuerySnapshot querySnapshot = await UserList.doc(uid).collection(status).get();

    // Loop through the documents in the snapshot
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // Check if the document exists
      if (documentSnapshot.exists) {
        // Extract the data as a Map<String, dynamic>
        Map<String, dynamic>? userData = documentSnapshot.data() as Map<String, dynamic>?;
        dynamic listPlatformData = userData!['listplatform'];
    List<String> listsData = List<String>.from(listPlatformData);
    // Create a new MyList object using the listsData
    MyList lists = MyList.fromJson({
      'idGame': userData['idGame'],
      'name': userData['name'],
      'released': userData['released'],
      'imageurl': userData['imageurl'],
      'Progressgame' : 0,
      'ratingUsers' : 0,
      'listplatform': listsData,
    });
    // Add the MyList object to the newLists
    newLists.add(lists);
    }
     print(newLists);
    }
  } catch (e) {
    // Handle any errors that might occur during the process
    print("Error retrieving user's list: $e");
  }
  // Assign the new list to the Lists variable
  Lists = newLists;
  // Notify listeners about the change
  notifyListeners();
}


  Future <void> addList(String uid,String status,GameModel gameModel) async{
  final CollectionReference UsersList = _firestore.collection('UsersList');
  
 UsersList.doc(uid).set({
  "idGame" : gameModel.idGame,
  "name" : gameModel.name,
  "released": gameModel.Released,
  "imageurl": gameModel.image,
  "ratingUsers" : 0,
  "Progressgame":0,
  'Status' : status,
  "listplatform" : gameModel.listplat.map((e) => e.name),
 });
  }
  Future <void> removeList(String uid, String status, String id) async{
    final CollectionReference UsersList =_firestore.collection('UsersList').doc(uid).collection(status);
    await UsersList.doc(id).delete(); 
  }
  
  MyList? getMyListByid(String docId,String uid,String status){
    final CollectionReference UsersList = _firestore.collection('UsersList').doc(uid).collection(status);
    try{
    DocumentSnapshot data = UsersList.doc(docId).get() as DocumentSnapshot<Object?>;
  
    if(data.exists){
      Map<String, dynamic> datajson =data.data() as Map<String,dynamic>;
      MyList myList = MyList.fromJson(datajson);
      return myList;
    }else{
      return null;
    }
    }catch (e){
      print("Error : $e");
      return null;
    }
  }
  Future<String?> getDocIdList(String uid, String status, String idx) async {
    final CollectionReference UsersList =
        _firestore.collection('UsersList').doc(uid).collection(status);

    QuerySnapshot querySnapshot = await UsersList.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      if (documentSnapshot.data() == idx) {
        return documentSnapshot.id;
      }
    }
    return null;
  }
}