import 'package:flutter/material.dart';
import 'package:gamview/Screen/Category_page.dart';
import 'package:gamview/Screen/Discover_page.dart';
import 'package:gamview/Screen/News_page.dart';
import 'package:gamview/Screen/home_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
 
}
class _BottomNavbarState extends State<BottomNavbar> {
   int IdxPages = 0;

   final Pages = [
    const DiscoverPage(),
    const Homepage(),
    const NewsListPage(),
    const CategoryPage(),
   ];
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xFFDFD7BF),
            borderRadius: BorderRadius.circular(20),
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IdxPages != 0 ?
          IconButton(
              onPressed: () {  
                setState(() {
                  IdxPages = 0;
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return Homepage();
                      })
                    );
                });
              },
            icon: Icon(Icons.home_filled,
                size: 32,
                color: Colors.black, 
              ) 
              ) : Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF008170),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_filled,
                size: 32,
                color: Colors.black, 
              ),
              Text("Home",style: TextStyle(
                      fontSize:20,
                        color: Colors.white                  
                    ),
                    )
                  ],

            ),
                    
                                  ),
        IdxPages != 1 ?
          IconButton(
              onPressed: () {  
                setState(() {
                  IdxPages = 1;
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return NewsListPage();
                      })
                    );
                });
              },
            icon: Icon(Icons.newspaper_outlined,
                size: 32,
                color: Colors.black, 
              ) 
              ) : Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF008170),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_filled,
                size: 32,
                color: Colors.black, 
              ),
              Text("News",style: TextStyle(
                      fontSize:20,
                        color: Colors.white                  
                    ),
                    )
                  ],

            ),
                    
                                  ),
             IdxPages != 2 ?
          IconButton(
              onPressed: () {  
                setState(() {
                  IdxPages = 2;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return DiscoverPage();
                      })
                    );
                });
              },
            icon: Icon(Icons.search_outlined,
                size: 32,
                color: Colors.black, 
              ) 
              ) : Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF008170),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_outlined,
                size: 32,
                color: Colors.black, 
              ),
              Text("Discover",style: TextStyle(
                      fontSize:20,
                        color: Colors.white                  
                    ),
                    )
                  ],

            ),
                    
                                  ),
          IdxPages != 3 ?
          IconButton(
              onPressed: () {  
                setState(() {
                  IdxPages = 3;
                });
              },
            icon: Icon(Icons.view_list,
                size: 32,
                color: Colors.black, 
              ) 
              ) : Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF008170),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.view_list,
                size: 32,
                color: Colors.black, 
              ),
              Text("Category",style: TextStyle(
                      fontSize:20,
                        color: Colors.white                  
                    ),
                    )
                  ],

            ),
                                  ),
                                   IdxPages != 4 ?
          IconButton(
              onPressed: () {  
                setState(() {
                  IdxPages = 4;
                });
              },
            icon: Icon(Icons.bookmark,
                size: 32,
                color: Colors.black, 
              ) 
              ) : Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF008170),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark,
                size: 32,
                color: Colors.black, 
              ),
              Text("My List",style: TextStyle(
                      fontSize:20,
                        color: Colors.white                  
                    ),
                    )
                  ],

            ),
                                  ),
          ])
    );
  }
}