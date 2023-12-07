

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
  
  String? get idx => idx;
  void setStatus(String status){
    _status=status;
    notifyListeners();
  }
 Future<void> GetUsersList(String uid, String status) async {
  List<MyList> newLists = [];
  CollectionReference UserList = _firestore.collection('UsersDetail');

  try {
    QuerySnapshot querySnapshot = await UserList.doc(uid).collection("Listusers").where(
      "status", isEqualTo: status).get();

    // Loop through the documents in the snapshot
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
  // Extract the data as a Map<String, dynamic>
  Map<String, dynamic>? userData = documentSnapshot.data() as Map<String, dynamic>?;

  if (userData != null) {
    dynamic listPlatformData = userData['listplatform'];
    List<String> listsData = List<String>.from(listPlatformData);
    
    MyList lists = MyList.fromJson({
      'idGame': userData['idGame'],
      'name': userData['name'],
      'released': userData['released'],
      'imageurl': userData['imageurl'],
      'Progressgame': 0,
      'ratingUsers': 0,
      'listplatform': listsData,
    });
    print(lists);
    newLists.add(lists);
  }
}
  } catch (e) {
    // Handle any errors that might occur during the process
    print("Error retrieving user's list: $e");
  }
  Lists = newLists;

  notifyListeners();
}


  Future <void> addList(String uid,String status,GameModel gameModel) async{
  final CollectionReference UsersList = _firestore.collection('UsersDetail');

 UsersList.doc(uid).collection("Listusers").doc().set({
  "idGame" : gameModel.idGame,
  "name" : gameModel.name,
  "released": gameModel.Released,
  "imageurl": gameModel.image,
  "ratingUsers" : 0,
  "Progressgame":0,
  "status":status,
  "listplatform" : gameModel.listplat.map((e) => e.name),
 });
}

  Future<void> removeList(String uid, String status, String id) async {
  final CollectionReference UsersList = _firestore.collection('UsersDetail');

  try {
    QuerySnapshot querySnapshot = await UsersList.doc(uid).collection("Listusers").where("idGame", isEqualTo: id).get();

    for (QueryDocumentSnapshot queryDocumentSnapshot in querySnapshot.docs) {
      String idx = queryDocumentSnapshot.id;
      print(idx);
      await UsersList.doc(uid).collection("Listusers").doc(idx).delete();
    }
  } catch (e) {
    print("Error: $e");
  }
}


  Future<MyList?> getMyListById(String idgame, String uid) async {
  final CollectionReference usersList = _firestore.collection('UsersDetail').doc(uid).collection('Listusers');

  try {
    QuerySnapshot querySnapshot = await usersList.where('idGame', isEqualTo: idgame).get();

    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot docSnapshot = querySnapshot.docs.first;
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
       dynamic listPlatformData = data!['listplatform'];
    List<String> listsData = List<String>.from(listPlatformData);
      MyList myList = MyList.fromJson({
        'idGame': data!['idGame'],
      'name': data['name'],
      'released': data['released'],
      'imageurl': data['imageurl'],
      'Progressgame': data['progressgame'],
      'ratingUsers': data['ratingUsers'],
      'listplatform': listsData,
    });

      // Return the MyList object

      return myList;

    } else {

      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

 

Future<bool?> checkuser(String uid, String status, String gameId) async {
  CollectionReference UserList = _firestore.collection('UsersList');

  try {
    QuerySnapshot querySnapshot = await UserList.doc(uid).collection("Listusers").where(
      "status", isEqualTo: status,
    ).get();

    bool isGameInList = querySnapshot.docs.any((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      return userData['idGame'] == gameId;
    });

    if (isGameInList) {
      print('Game with id $gameId is in the user\'s list for status $status.');
    } else {
      print('Game with id $gameId is not in the user\'s list for status $status.');
    }

    return isGameInList; 

  } catch (e) {
    print("Error checking user's list: $e");
    return false; 
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