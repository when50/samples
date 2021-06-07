import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterEmbededWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell2',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: Container(
        child: FlutterContentWidget(),
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
  
}

class FlutterContentWidget extends StatefulWidget {
  @override
  _FlutterContentState createState() => _FlutterContentState();
}

class _FlutterContentState extends State<FlutterContentWidget> {
  MethodChannel _channel;
  Widget _contentWidget;

  @override
  void initState() {
    super.initState();
    _contentWidget = FourItemsBox();
    _channel = MethodChannel("setup-content");
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "updateView") {
        // A notification that the host platform's data model has been updated.
        setState(() {
          // _contentWidget = Text("2" + call.arguments);
        });
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: GestureDetector(child: _contentWidget, onTap: () => invokeTap(),),
    // );
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: GestureDetector(child: _contentWidget, onTap: () => invokeTap(),),
      ),
    );
  }

  void invokeTap() {
    _channel.invokeMethod("click");
  }
}

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