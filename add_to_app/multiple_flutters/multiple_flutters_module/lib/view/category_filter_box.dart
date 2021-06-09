import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multiple_flutters_module/view/support_tap.dart';

class CategoryFilterBox extends StatefulWidget {
  CategoryFilterBox(this.filterTitles);
  final List<String> filterTitles;

  @override
  _CategoryFilterBoxState createState() => _CategoryFilterBoxState();

}

class _CategoryFilterBoxState extends State<CategoryFilterBox> {
  int selectedIndex = 0;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: ListView.separated(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: Text(
              widget.filterTitles[index],
              style: TextStyle(color: index == selectedIndex ? Colors.red : Colors.yellow),
            ),
            onTap: () => selectedAt(index),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (BuildContext context, int index) {
          return VerticalDivider(color: Color(0x00000000), width: 34,);
        },
        itemCount: widget.filterTitles.length, 
        scrollDirection: Axis.horizontal,
      ),
      constraints: BoxConstraints(maxHeight: 15),
    );
  }

  void selectedAt(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}