import 'package:flutter/material.dart';

class FourItemsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: [
          VerticalBook(
            imageUrl: "http://s.dyreader.cn/g/9a/a4/1383975598143066656_360_480_poster.jpeg", 
            title: "女侠，你要相公不要", 
            score: "9",
          ),
          VerticalBook(
            imageUrl: "http://s.dyreader.cn/g/9a/a4/1383975598143066656_360_480_poster.jpeg", 
            title: "女侠，你要相公不要", 
            score: "9",
          ),
          VerticalBook(
            imageUrl: "http://s.dyreader.cn/g/9a/a4/1383975598143066656_360_480_poster.jpeg", 
            title: "女侠，你要相公不要", 
            score: "9",
          ),
          VerticalBook(
            imageUrl: "http://s.dyreader.cn/g/9a/a4/1383975598143066656_360_480_poster.jpeg", 
            title: "女侠，你要相公不要", 
            score: "9",
          ),
        ],
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