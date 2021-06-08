import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';
import 'package:multiple_flutters_module/models/one_item_model.dart';

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
            GestureDetector(child: FourItemsBox(FourtItems()), onTap: () => invokeTap(),),
            HomeOneItemBox(OneItemModel()),
          ],
          mainAxisSize: MainAxisSize.min,
        )
      );
    _channel = MethodChannel("setup-content");
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "updateView") {
        Map map = call.arguments as Map;
        setState(() {
          var modelMap = Map<String, dynamic>.from(map["viewModel"]);
          switch (map["viewName"] as String) {
            case "10":
            var model = FourtItems.fromJson(modelMap);
            print("fouteritems: $model");
            _contentWidget = FourItemsBox(model);
            break;
            case "9":
            var model = OneItemModel.fromJson(modelMap);
            _contentWidget = HomeOneItemBox(model);
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