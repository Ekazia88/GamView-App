import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
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
    required this.status, required this.list,
  }) : super(key: key);

  final String idx;
  final String uid;
  final String status;
  final MyList? list;

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
          return _buildUI(context, widget.list,);
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
                    Savedata(selectedStatus, getRatingValue(), widget.uid, getprogressValue(), myList!.idGame, myList);
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
Future <void> Savedata(String Status, int rating,String uid, int progressgame, String idgame,MyList updatelist) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference UsersList = _firestore.collection('UsersDetail');

  
     QuerySnapshot querySnapshot = await UsersList
      .doc(uid)
      .collection("Listusers")
      .where("idGame", isEqualTo: idgame)
      .get();
      if(querySnapshot.docs.isNotEmpty){
        String docId =  querySnapshot.docs.first.id;
        print(docId);
        UsersList.doc(uid).collection("Listusers").doc(docId).update({
      "ratingUsers" : rating,
      "progressgame": progress,
      "status": Status,
        });
    }else{
      print("No document found");
    }
  }
}