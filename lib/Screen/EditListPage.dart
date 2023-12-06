import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Provider/MyListProvider.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../Models/UsersList.dart';
import '../Widget/MyList/ItemButton.dart';
import '../Widget/MyList/NumPick.dart';

class EditListPage extends StatefulWidget {
  const EditListPage({
    Key? key,
    required this.idx,
    required this.uid,
    required this.status,
  }) : super(key: key);

  final String idx;
  final String uid;
  final String status;

  @override
  State<EditListPage> createState() => _EditListPageState();
  
}

class _EditListPageState extends State<EditListPage> {
   late String selectedStatus;
   late int progress;
   late int rating;
   int getprogressValue() {
    return progress; // Assuming 'progress' is the value you want to retrieve
  }
   int getRatingValue() {
    return rating; // Assuming 'progress' is the value you want to retrieve
  }
  @override
  void initState() {
    super.initState();
    selectedStatus = widget.status; 
    rating = 0;
    progress = 0;
  }
  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder<MyList?>(
      future: Fecthdata(widget.uid, widget.status, widget.idx),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: CircularProgressIndicator()
            );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          MyList? myList = snapshot.data;
          return _buildUI(context, myList,);
        }
      },
    );
  }

  Widget _buildUI(BuildContext context, MyList? myList) {
    List <String> statuslist =["Onprogress","Finish","WishList"];
    String setStatus = widget.status;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close_rounded),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Savedata(widget.uid, selectedStatus, widget.status, getRatingValue(), getRatingValue(), widget.idx, myList!);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
            StatefulBuilder(builder: (context,setState){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myList?.name ?? 'kosong',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Status",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemBtn(
                      title: statuslist[0], 
                      clr: Colors.white60, 
                      status: selectedStatus,
                      onTap: (){
                        setState(() {
                            selectedStatus = statuslist[0];
                            
                          });
                      },
                      ),
                    ItemBtn(
                      title: statuslist[1], 
                      clr: Colors.blue, 
                      status: selectedStatus,
                      onTap: () {
                        setState(() {
                            selectedStatus = statuslist[1];
                          });
                      },
                     ),
                    ItemBtn(
                      title: statuslist[2], 
                      clr: Colors.brown, 
                      status: selectedStatus,
                      onTap: () {
                       setState(() {
                            selectedStatus = statuslist[2];
                          });
                      },
                      ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  "Rating",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                Numpick(value: myList!.ratingUsers, onChanged: (int value) { 
                   setState(() {
    rating = value;
  });
                 },),
                Text(
                  "Progress",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                Numpick(value: myList!.ProgressGame, onChanged: (int value) { 
                   setState(() {
    progress = value;
  });
                 },),
              ],
            );
            }
            )
          ],
        ),
      ),
    );
  }
Future<String?> getDocIdList(String Username, String status, String idx) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference UsersList =
        _firestore.collection('UsersList').doc(Username).collection(status);
    try{
    QuerySnapshot querySnapshot = await UsersList.get();
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
       Map<String, dynamic>? userData = documentSnapshot.data() as Map<String, dynamic>?;
      if (userData!['idGame'] == idx) {
        return documentSnapshot.id;
      }
    }
    return null;
    }catch(e){
      print("Error: $e");
      return null;
    }
  }
Future <void> Savedata(String Username, String newStatus,String Status, int rating, int progressgame,String idx,MyList updatelist) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference UsersList = _firestore.collection('UsersList').doc(Username).collection(newStatus);
  String? docId = await getDocIdList(Username, Status, idx);
  var uuid = Uuid();
  String docuid = uuid.v4();
  try{
    DocumentSnapshot data = await UsersList.doc(docId).get();
    if(data.exists){
     await UsersList.doc(docId).update({
        'ratingUsers': rating,
        'progressgame' : progressgame,
      });
    }else{
     await _firestore.collection('UsersList').doc(Username).collection(newStatus).doc(docuid).set({
      "idGame" : updatelist.idGame,
      "name" : updatelist.name,
      "released": updatelist.Released,
      "imageurl": updatelist.imageurl,
      "ratingUsers" : rating,
      "progressgame": progress,
      "listplatform" : updatelist.listplatform.map((e) => e),
 });
 DocumentSnapshot checkupdate = await UsersList.doc(docuid).get();
 if(checkupdate.exists){
    await removeList(Username, Status, docId!); 
    }
}
  }catch(e){
    print("Error : $e");
  }
}
Future <void> removeList(String username, String status, String id) async{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference UsersList =_firestore.collection('UsersList').doc(username).collection(status);
    await UsersList.doc(id).delete(); 
  }
Future<MyList?> Fecthdata(String username, String Status, String idx) async {
    String? docId = await getDocIdList(username, Status, idx);
    if (docId != null) {
      MyList? myList = await getMyListByid(username, Status, docId);

      return myList;
    } else {
      return null;
    }
  }

Future <bool> checkStatus(String Username, String status,String idx) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference UsersList = _firestore.collection('UsersList').doc(Username).collection(status);
    String? docId = await getDocIdList(Username, status, idx);
    try{
    DocumentSnapshot data = await UsersList.doc(docId).get();
    if(data.exists){
      return true;
    }
    }catch (e) {
      print("Error : $e");
    }
    return false;
  }

  

  Future<MyList?> getMyListByid(String username, String status, String idx) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference UsersList =
        _firestore.collection('UsersList').doc(username).collection(status);
    try {
      DocumentSnapshot data = await UsersList.doc(idx).get();
      if (data.exists) {
        Map<String, dynamic> datajson = data.data() as Map<String, dynamic>;
        MyList myList = MyList.fromJson(datajson);
        return myList;
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
