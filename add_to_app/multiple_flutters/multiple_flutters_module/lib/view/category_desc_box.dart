import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/view/support_view_model.dart';

class CategoryDescBox extends StatelessWidget {
  CategoryDescBox({this.viewModel});
  final SupportViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: CategoryRoundRectBox(title: viewModel.dataWithKey("desc", "AAbA"),),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    );
  }
}

class CategoryRoundRectBox extends StatelessWidget {
  CategoryRoundRectBox({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: DecoratedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 5,
              child: Image(
                image: AssetImage("images/channel_filter.png"),
                width: 22,
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0x99000000),
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Color(0xfffff6ec)),
      ),
      borderRadius: BorderRadius.circular(2),
    );
  }
}