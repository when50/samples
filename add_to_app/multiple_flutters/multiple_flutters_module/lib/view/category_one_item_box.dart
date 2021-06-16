import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/view/gap_box.dart';
import 'package:multiple_flutters_module/view/support_view_model.dart';
import 'package:multiple_flutters_module/view/support_tap.dart';

class CategoryOneItemBox extends StatelessWidget implements SupportTap {
  CategoryOneItemBox({this.viewModel, this.tapInvoke});
  SupportViewModel viewModel;
  final Function tapInvoke;

  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width - 55) / 4;
    double textWidth = MediaQuery.of(context).size.width - 55 - imageWidth;
    return GestureDetector(
      child: Container(
        child: Row(
          children: [
            Image(
              image:NetworkImage(viewModel.dataWithKey("posterUrl", "")), 
              width: imageWidth,
            ),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(color: Colors.red),
                height: 120,
                child: Column(
                  children: [
                    Row(
                        children: [
                          Text(
                            viewModel.dataWithKey("title", "title"),
                            style: TextStyle(
                              color: Color(0xd8000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Center(
                            child: Text(
                              viewModel.dataWithKey("score", "score"),
                              style: TextStyle(
                                color: Color(0xfffca017),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      // GapBox(height:8, width: 0),
                      Container(
                        child:  Text(
                            viewModel.dataWithKey("intro", "intro"),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0x99000000),
                              fontSize: 12,
                            ),
                        ),
                        height: 50,
                      ),
                      // GapBox(height:13, width: 0),
                      Text(
                        viewModel.dataWithKey("info", "info"),
                        style: TextStyle(
                          color: Color(0x66000000),
                          fontSize: 12,
                        )
                      ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onTap: () => invokeTap(),
    );
  }

  void invokeTap() {
    tapInvoke();
  }
}


                