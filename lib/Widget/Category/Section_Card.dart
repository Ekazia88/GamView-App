import 'package:flutter/material.dart';
import 'package:gamview/Models/Category.dart';
import 'package:gamview/Models/DataGame.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Models/UsersDetail.dart';
import 'package:gamview/Models/UsersList.dart';
import 'package:gamview/Provider/MyListProvider.dart';
import 'package:gamview/Provider/gameProvider.dart';
import 'package:gamview/Provider/usersProvider.dart';
import 'package:gamview/Widget/Card.dart';
import 'package:provider/provider.dart';

class SectionCategoryCard extends StatelessWidget {
  const SectionCategoryCard({Key? key});

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = Provider.of(context);
    MyListProvider myListProvider = Provider.of(context);
    UsersProviders user = Provider.of(context);
    user.getUsers();
    UsersDetail? usersDetail = user.users;
    String catId = gameProvider.catId;
    gameProvider.showGameByCat(catId);
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    double totalHeight = 100.0 * 3; // Default height for 3 rows
    double gridItemHeight = 300.0; // Height of each grid item

    if (lstT.length > 0) {
      int rowCount = (lstT.length / 2).ceil(); // Assuming 2 items per row
      totalHeight = rowCount * gridItemHeight;
    }

    return Column(
      children: [
        Center(
          child: Text(gameProvider.title, style: Theme.of(context).textTheme.bodyLarge),
        ),
        SizedBox(height: 10,),
        Flexible(
          child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: lebar,
                height: tinggi,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
              ),
              Positioned(
                top: 10,
                child: SingleChildScrollView(
                  child: Container(
                    height: totalHeight,
                    width: lebar,
                    child: gameProvider.gamelist.isEmpty ?
                    Text("Kosong",style: TextStyle(
                      color: Colors.black
                    ),) 
                    :GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: gridItemHeight,
                      ),
                      itemCount: gameProvider.gamelist.length,
                      itemBuilder: (context, index) {
                       GameModel gamedata = gameProvider.gamelist[index];
                       List<CatModel> genre = gamedata.listcat;
                        return GridTile(
                          child: CardContainer(
                            Genre: genre.isNotEmpty ?
                            genre.map((cat) => cat.name).join(',')
                            :'no genre',
                            Title: '${gamedata.name}',
                            ImagePath: "assets/Images/Howard_legacy_news.jpg",
                            onTap: () {
                            },
                            onPressed: () => {
                              myListProvider.addList(usersDetail!.username, "Onprogress", gamedata)
                            },
                          ),
                        );

                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ],
    );
  }
}
