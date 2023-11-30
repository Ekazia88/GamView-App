import 'package:flutter/material.dart';

class SectSearch extends StatefulWidget {
  const SectSearch({Key? key}) : super(key: key);

  @override
  State<SectSearch> createState() => _SectSearchState();
}

class _SectSearchState extends State<SectSearch> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      padding: EdgeInsets.all(12),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isExpanded ? 300 : 200,
            height: 30,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isExpanded ? 20 : 10),
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded),
                SizedBox(width: 10),
                if (isExpanded)
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Game',
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  )
                else
                  Text(
                    "Search Game ",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
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
