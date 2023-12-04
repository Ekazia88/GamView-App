import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Provider/catProvider.dart';
import 'package:gamview/Provider/gameProvider.dart';
import 'package:gamview/Provider/usersProvider.dart';
import 'package:gamview/Screen/Category_page.dart';
import 'package:gamview/Screen/Discover_page.dart';
import 'package:gamview/Screen/Home_page.dart';
import 'package:gamview/Screen/MyListPage.dart';
import 'package:gamview/Screen/News_page.dart';
import 'package:gamview/Service/DataControllerUsers.dart';
import 'package:gamview/Service/auth_service.dart';
import 'package:gamview/Widget/BottomNavbar.dart';
import 'package:gamview/Widget/Homepage/IconProfile.dart';
import 'package:gamview/Widget/Navigation.dart';
import 'package:provider/provider.dart';

import '../Provider/MyListProvider.dart';

class pagesController extends StatefulWidget {
  const pagesController({Key? key}) : super(key: key);

  @override
  State<pagesController> createState() => _pagesControllerState();
}

class _pagesControllerState extends State<pagesController> {
  late PageController _pageController;
  UsersDetail? _userDetails; // Change here
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    initUserDetails();
  }

  @override
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Future<void> initUserDetails() async {
    try {
      UsersDetail userDetails = await Users().getID();
      setState(() {
        _userDetails = userDetails;
      });
    } catch (error) {
      // Handle error if needed
      print('Error initializing UserDetails: $error');
    }
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
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider(create: (context) => GameProvider()),
      ChangeNotifierProvider(create: (context) => UsersProviders()),
      ChangeNotifierProvider(create: (context) => MyListProvider())
    ],child: 
    Scaffold(
      drawer: NavigationWid(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(getAppBarTitle()),
        leading: FutureBuilder<UsersDetail>(
  future: Users().getID(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: IconProfile(
          image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Ftuoitre.vn%2Fca-si-goc-viet-hanni-newjeans-duoc-tim-kiem-nhieu-nhat-viet-nam-20230207145034537.htm&psig=AOvVaw0lQDgXgfaPddjCRVBgTj-J&ust=1701530723518000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJDR-YTG7oIDFQAAAAAdAAAAABAE",
          wdth: 50,
          hght: 50,
        ),
      );
    } else if (!snapshot.hasData) {
      // Handle the case where data is not available
      return Text('Data not available');
    } else {
      try {
        UsersDetail userDetails = snapshot.data!;
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: IconProfile(
            image: userDetails.imageurl ?? "", // Use a default value if null
            wdth: 50,
            hght: 50,
          ),
        );
      } catch (error) {
        print('Error in FutureBuilder: $error');
        return Text('Error: $error');
      }
    }
  },
),

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
      ),
    )
    );
  }
}
