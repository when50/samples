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
      home: FlutterContentWidget(),);
  }
  
}

class FlutterContentWidget extends StatefulWidget {
  @override
  _FlutterContentState createState() => _FlutterContentState();
}

class _FlutterContentState extends State<FlutterContentWidget> {
  MethodChannel _channel;
  String _contentWidget;

  @override
  void initState() {
    super.initState();
    _contentWidget = "BBB";
    _channel = MethodChannel("setup-content");
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "updateView") {
        // A notification that the host platform's data model has been updated.
        setState(() {
          _contentWidget = call.arguments as String;
        });
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_contentWidget),
    );
  }
}