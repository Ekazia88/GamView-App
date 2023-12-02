import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Screen/login_page.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import 'package:gamview/Service/auth_service.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';

import '../Admin/input_LatestNews.dart';

//membuat sidebar untuk antar halaman
class NavigationWid extends StatelessWidget {
  const NavigationWid({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuthService();  
     var usersDetails;
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // header dari sidbar
            Container(
                height: 120,
                child: DrawerHeader(
                    child: FutureBuilder<UsersDetail>(
  future: Users().getID(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      print(snapshot.error);
      return Text('Error: ${snapshot.error}');
    } else if (!snapshot.hasData) {
      // Handle the case where data is not available
      return Text('Data not available');
    } else {
      UsersDetail userDetails = snapshot.data!;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconProfile(
            image: userDetails.imageurl,
            wdth: 100,
            hght: 100,
          ),
          Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                userDetails.username,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 21,
                    ),
              ),
              Text(
                "Profile",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
              ),
            ],
          )
        ],
      );
    }
  },
),
                ),
            ),
            //list page di sidebar
            ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                }),
            ListTile(
                title: const Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/Add');
                }),
            ListTile(
              title: const Text(
                "About Us",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/About');
              },
            ),
            ListTile(
              title: const Text(
                "Add News",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddNewsScreen();
                }));
              },
            ),
            Spacer(),
            ListTile(
              title: const Text(
                "Log out",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                auth.SignOut();
                 Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
              },
            ),
          ],
        ),
      ),
    );
  }
}