import 'package:flutter/material.dart';
import 'package:gamview/Models/DataReview.dart';
import 'package:gamview/Widget/Card.dart';

class SectionCategoryCard extends StatelessWidget {
  const SectionCategoryCard({Key? key});

  @override
  Widget build(BuildContext context) {
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
          child: Text("RPG", style: Theme.of(context).textTheme.bodyLarge),
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
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: gridItemHeight,
                      ),
                      itemCount: lstT.length,
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: CardContainer(
                            Genre: lstT[index].Genre,
                            Title: lstT[index].Genre,
                            ImagePath: lstT[index].ImagePath,
                            onTap: () {},
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
