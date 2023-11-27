import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Screen/Category_page.dart';
import 'package:gamview/Screen/Discover_page.dart';
import 'package:gamview/Screen/Game_page.dart';
import 'package:gamview/Screen/Home_page.dart';
import 'package:gamview/Screen/MyListPage.dart';
import 'package:gamview/Screen/News_page.dart';
import 'package:gamview/Widget/BottomNavbar.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';
import 'package:gamview/Widget/Homepage/Section_Riview.dart';
import 'package:gamview/Widget/Homepage/Section_news.dart';
import 'package:gamview/Widget/Navigation.dart';
import 'package:gamview/Widget/Homepage/card.dart';
class pagesController extends StatefulWidget {
   const pagesController({Key? key}) : super(key: key);

  @override
  State<pagesController> createState() => _pagesControllerState();
}

class _pagesControllerState extends State<pagesController> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
   void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }
   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }
   String getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'GamView';
      case 1:
        return 'News';
      case 2:
        return 'Discover';
      case 3:
        return 'Category'; // Customize the title for CategoryPage
      case 4:
        return 'My List';
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer :NavigationWid(),
        appBar: AppBar(
          centerTitle: true,
        title: Text(getAppBarTitle()),
        leading: Builder(builder: (context) => IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: IconProfile(wdth: 50,hght: 50,)),
        )
        ),
        bottomNavigationBar: BottomNavbar(
          onPageChanged: onPageChanged,
          currentIndex: _currentIndex,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: const [
            Homepage(),
            NewsListPage(),
            DiscoverPage(),
            CategoryPage(),
            MyListPage(),
          ],
        )
        );
    }
}