import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'four_item_box.dart';
import 'home_one_item_box.dart';

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
    _contentWidget = Center(
        child: Column(
          children: [
            GestureDetector(child: FourItemsBox(), onTap: () => invokeTap(),),
            HomeOneItemBox(),
          ],
          mainAxisSize: MainAxisSize.min,
        )
      );
    _channel = MethodChannel("setup-content");
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "updateView") {
        print("${call.arguments}");
        Map map = call.arguments as Map;
        setState(() {
          switch (map["viewName"] as String) {
            case "10":
            _contentWidget = FourItemsBox();
            break;
            case "9":
            _contentWidget = HomeOneItemBox();
            break;
          }
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
      child: _contentWidget,
    );
  }

  void invokeTap() {
    _channel.invokeMethod("click");
  }
}