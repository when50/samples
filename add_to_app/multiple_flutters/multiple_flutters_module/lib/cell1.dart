import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@pragma('vm:entry-point')
void cell1() => runApp(Cell1(Colors.blue));

class Cell1 extends StatelessWidget {
  Cell1(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell2',
      theme: ThemeData(
        primaryColor: this.color
      ),
      home: Content1(),);
  }
  
}

class Content1 extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cell1050"),
    );
  }
}