//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gamview/Models/NavBarItem.dart';
import 'package:gamview/Screen/Category_page.dart';
import 'package:gamview/Screen/Discover_page.dart';
import 'package:gamview/Screen/News_page.dart';
import 'package:gamview/Screen/pageController.dart';

import '../Screen/home_page.dart';

class BottomNavbar extends StatefulWidget {
  final Function(int) onPageChanged;
  final int currentIndex;

  const BottomNavbar(
      {Key? key, required this.onPageChanged, required this.currentIndex})
      : super(key: key);
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final Pages = [
    const DiscoverPage(),
    const Homepage(),
    const NewsListPage(),
    const CategoryPage(),
  ];
  final List<NavBarItem> navBarItems = [
    NavBarItem(icon: Icons.home_filled, label: "Home"),
    NavBarItem(icon: Icons.newspaper_outlined, label: "News"),
    NavBarItem(icon: Icons.search_outlined, label: "Discover"),
    NavBarItem(icon: Icons.view_list, label: "Category"),
    NavBarItem(icon: Icons.bookmark, label: "My List"),
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
          children: List.generate(
              5,
              (idx) => buildItemNavBar(
                  navBarItems[idx].icon, navBarItems[idx].label, idx)),
        ));
  }

  Widget buildItemNavBar(IconData icon, String label, int index) {
    return widget.currentIndex != index
        ? IconButton(
            onPressed: () {
              widget.onPageChanged(index);
            },
            icon: Icon(
              icon,
              size: 32,
              color: Colors.black,
            ))
        : Container(
            width: 140,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF008170),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3.5,
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          );
  }
}
