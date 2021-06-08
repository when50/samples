import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';

class FourItemsBox extends StatelessWidget {
  FourtItems model;
  FourItemsBox(this.model);

  @override
  Widget build(BuildContext context) {
    print("@@@@ ${model}");
    List<VerticalBook> books = model.items.map((e) => VerticalBook(
            imageUrl: e.cover, 
            title: e.title, 
            score: "9")).toList();
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