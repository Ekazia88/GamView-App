import 'package:flutter/material.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';

import '../Admin/input_LatestNews.dart';

//membuat sidebar untuk antar halaman
class NavigationWid extends StatelessWidget {
  const NavigationWid({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconProfile(
                      wdth: 100,
                      hght: 100,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Ekazia",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 21,
                                  ),
                        ),
                        Text(
                          "Profile",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                        )
                      ],
                    )
                  ],
                ))),
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
            SizedBox(
              height: 330,
            ),
            ListTile(
              title: const Text(
                "Log out",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/About');
              },
            ),
          ],
        ),
      ),
    );
  }
}
