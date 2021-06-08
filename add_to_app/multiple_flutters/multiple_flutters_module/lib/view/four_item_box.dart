import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';
import 'package:multiple_flutters_module/view/support_tap.dart';

class FourItemsBox extends StatelessWidget implements SupportChildTap {
  Function(int) childTapInvoke;
  FourtItems model;
  FourItemsBox(this.model, this.childTapInvoke);

  @override
  Widget build(BuildContext context) {
    int childIndex = 0;
    List<Widget> books = model.items.map((e) {
      num arg = childIndex;
      childIndex += 1;
      return new GestureDetector(
              child: VerticalBook(
                imageUrl: e.cover, 
                title: e.title, 
                score: "9"
              ),
              onTap: () => invokeTapChild(arg),
            );
    }).toList();
    return Padding(
      child: Row(
        children: books,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 35.0
      )
    );
  }

  @override
  void invokeTapChild(int atIndex) {
    childTapInvoke(atIndex);
  }
}

class VerticalBook extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String score;

  VerticalBook({this.imageUrl, this.title, this.score});

  @override
  Widget build(BuildContext context) {
    num width = (MediaQuery.of(context).size.width - 115) / 4;
    return Center(
      child: Column(
        children: [
          Image(
            image: NetworkImage(imageUrl),
            width: (width),
          ),
          ConstrainedBox(
            child: Text(
              title, 
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff343434),
                fontSize: 14,
              ),
            ),
            constraints: BoxConstraints(maxWidth: width),
          ),
          Text(
            score, 
            style: TextStyle(
              color: Color(0xffff9510),
              fontSize: 11,
            )
          ),
        ],
        mainAxisSize: MainAxisSize.min, // 占用空间
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}