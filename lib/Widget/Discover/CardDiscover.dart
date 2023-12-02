import 'package:flutter/material.dart';
import '../circleNumber.dart';

class CardDiscoverContainer extends StatelessWidget {
  final int idx;
  final String title;
  final String Genre;
  final String platform;
  final String released;
  final double Rating;
  final void Function()? onTap;

  const CardDiscoverContainer({
    Key? key,
    required this.idx,
    required this.title,
    required this.Genre,
    required this.platform,
    required this.released,
    required this.Rating,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).cardTheme.color,
          ),
          child: Padding(
            padding: EdgeInsets.all(13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 180,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 12),
                            Text(
                              platform,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              released,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              Genre,
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15), // Add padding here
                        child: CircleNumber(number: Rating),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
