

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamview/Models/UsersDetail.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference users = FirebaseFirestore.instance.collection("DetailsUsers");
class Users{
  
  Future <UsersDetail> getID()async {  
    User? user = FirebaseAuth.instance.currentUser;
   QuerySnapshot query = await FirebaseFirestore.instance.collection("UsersDetail").where('email',isEqualTo: user!.email).get();
   print(user.email);
    if(query.docs.isNotEmpty){
      var dataUser = query.docs.first.data() as Map<String, dynamic>;
      return UsersDetail.fromFirestore(dataUser);
    }else{
      return Future.error('Id tidak ada');
    }
  }
}