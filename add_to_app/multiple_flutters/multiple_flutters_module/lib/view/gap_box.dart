import 'package:flutter/material.dart';

class GapBox extends StatelessWidget {
  GapBox({this.width, this.height});
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height, 
        minWidth: width
      )
    );
  }
}