import 'package:firebase_auth/firebase_auth.dart';

import '../Models/UsersDetail.dart';

class FirebaseAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;  

  Future<void> SignUp(String email, String password) async{
      final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
   Future<void> SignIn(String email, String password) async{
      final currentuser = _auth.currentUser;
      final user =  await _auth.signInWithEmailAndPassword(email: email, password: password);   
  }
  
  Future<bool> Islogin() async{
    final currentuser = _auth.currentUser;
    return currentuser != null;
  }
  Future<void> SignOut() async {
  await FirebaseAuth.instance.signOut();
}
}

