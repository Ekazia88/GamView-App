import 'package:flutter/material.dart';
//membuat sidebar untuk antar halaman
class NavigationWid extends StatelessWidget {
  const NavigationWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // header dari sidbar
               const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Align(alignment: Alignment.center,
                child: Text('GamView App',style: TextStyle(
                  fontSize: 20, color: Colors.white,
                ),),
                ) 
                
              ),
              //list page di sidebar
              ListTile(
                title: const Text("Home",style: TextStyle(
                  fontSize: 20
                ),),
                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                }
              ),
              ListTile(
               title: const Text("Tambah Review",style: TextStyle(
                  fontSize: 20
                ),),
                onTap: () {
                  Navigator.of(context).pushNamed('/Add');
                }
              ),
              ListTile(
                title: const Text("Tentang Kami",style: TextStyle(
                  fontSize: 20
                ),),
                onTap: (){
                      Navigator.of(context).pushNamed('/About');
                },
              ),

            ],
          ),
    );
  }
}