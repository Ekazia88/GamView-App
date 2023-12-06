import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Service/auth_service.dart';
import 'package:intl/intl.dart';
import '../Models/UsersDetail.dart';

class ProfilePage extends StatelessWidget {
  final UsersDetail users;
  const ProfilePage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    DateTime dt = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(users.DateCreated);
    String convertdate = DateFormat.yMMMM().format(dt);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          users.imageurl)
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      users.username,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),  
                    SizedBox(height: 8.0),
                    FutureBuilder<bool>(future: FirebaseAuthService().Islogin(), builder:(context,snapshot){
                     bool? active = snapshot.data;
                     return Text(
                      active! ? "Status : Online" : "Status : Offline",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    );
  }),
                    SizedBox(height: 8.0),
                    Text(
                      'Joined: $convertdate',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            FutureBuilder<List>(future: countList(users), builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: 
                CircularProgressIndicator()
                );
              }else if (snapshot.hasError){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image:AssetImage(
                        'assets/Icon/Error Icon.png' 
                    ),
                    )
                  ],
                  
                );
              }else{
            List? count = snapshot.data;

            return
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${count![0]}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'Onprogress',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ]),
                   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${count![1]}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'Finish',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ]),
                   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${count![2]}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'WishList',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${count![3]}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'Favorit',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ]),
              ],
            );
              }
            }),
            SizedBox(height: 16.0),
            Text(
              'Favorite Games:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'URL_GAMBAR_GAME_1',
                          height: 50.0,
                          width: 50.0,
                        ),
                        SizedBox(height: 8.0),
                        Text('Nama Game 1'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'URL_GAMBAR_GAME_2',
                          height: 50.0,
                          width: 50.0,
                        ),
                        SizedBox(height: 8.0),
                        Text('Nama Game 2'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<List<int>> countList(UsersDetail users) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference countonproggress = firestore.collection('UsersList').doc(users.username).collection('Onprogress');
  CollectionReference countfinished = firestore.collection('UsersList').doc(users.username).collection('Finish');
  CollectionReference countWishlisted = firestore.collection('UsersList').doc(users.username).collection('WishList');
  CollectionReference countFavorited = firestore.collection('UsersList').doc(users.username).collection('Favorited');

  var onProgressQuery = await countonproggress.get();
  var finishedQuery = await countfinished.get();
  var wishListedQuery = await countWishlisted.get();
  var favoritedQuery = await countFavorited.get();

  var dataOnProgress = onProgressQuery.size;
  var dataFinish = finishedQuery.size;
  var dataWishList = wishListedQuery.size;
  var dataFavorit = favoritedQuery.size;

  return [dataOnProgress, dataFinish, dataWishList, dataFavorit];
}
}
