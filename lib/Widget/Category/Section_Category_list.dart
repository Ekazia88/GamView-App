import 'package:flutter/material.dart';
import 'package:gamview/Provider/catProvider.dart';
import 'package:gamview/Widget/RoundedImageTextBtn.dart';
import 'package:provider/provider.dart';

import '../../Provider/gameProvider.dart';

class SectionCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryProvider catprovider = Provider.of(context);
    GameProvider gameProvider = Provider.of(context);
    catprovider.getCatData();
    return SizedBox(
      height: 100,
      child: ListView.builder(
              itemCount: catprovider.catlist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return RoundedImageTextBtn(
                  image: catprovider.catlist[index].Catimage,
                  title: catprovider.catlist[index].name,
                  TextColor: Colors.black,
                  onTap: () {
                    gameProvider.showGameByCat(catprovider.catlist[index].CatId);
                  },
                );
              },
            ),
    );
  }
}