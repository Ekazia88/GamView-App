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
 Future<void> GetUsersList(String Username, String status) async {
  List<MyList> newLists = [];
  CollectionReference UserList = _firestore.collection('UsersList');

  try {
    QuerySnapshot querySnapshot = await UserList.doc(Username).collection(status).get();

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
      'listplatform': listsData,
    });
    // Add the MyList object to the newLists
    newLists.add(lists);
    }
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


  Future <void> addList(String Username,String status,GameModel gameModel) async{
  final CollectionReference UsersList = _firestore.collection('UsersList');

 UsersList.doc(Username).collection(status).doc().set({
  "idGame" : gameModel.idGame,
  "name" : gameModel.name,
  "released": gameModel.Released,
  "imageurl": gameModel.image,
  "ratingUsers" : 0,
  "Progressgame":0,
  "listplatform" : gameModel.listplat.map((e) => e.name),
 });
  }
  Future <void> removeList(String username, String status, String id) async{
    final CollectionReference UsersList =_firestore.collection('UsersList').doc(username).collection(status);
    await UsersList.doc(id).delete(); 
  }
  
  MyList? getMyListByid(String docId,String username, String status){
    final CollectionReference UsersList = _firestore.collection('UsersList').doc(username).collection(status);
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
  Future<String?> getDocIdList(String Username, String status, String idx) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference UsersList =
        _firestore.collection('UsersList').doc(Username).collection(status);

    QuerySnapshot querySnapshot = await UsersList.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      if (documentSnapshot.data() == idx) {
        return documentSnapshot.id;
      }
    }
    return null;
  }

  
}