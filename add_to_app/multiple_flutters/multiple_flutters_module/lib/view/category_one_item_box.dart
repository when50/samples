import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/models/category_one_item_model.dart';
import 'package:multiple_flutters_module/view/gap_box.dart';

class CategoryOneItemBox extends StatelessWidget {
  CategoryOneItemBox({this.viewModel});
  CategoryOneItemModel viewModel;

  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width - 55) / 4;
    double textWidth = MediaQuery.of(context).size.width - 55 - imageWidth;
    return Padding(
      child: Row(
        children: [
          Expanded(
            child: Image(
              image:NetworkImage(viewModel.imageUrl), 
              width: imageWidth,
            ),
            flex: 0,
          ),
          Expanded(
            child: Padding(
              child: Column(
                children: [
                  Row(
                      children: [
                        Text(
                          viewModel.title,
                          style: TextStyle(
                            color: Color(0xd8000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Center(
                          child: Text(
                            viewModel.score,
                            style: TextStyle(
                              color: Color(0xfffca017),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.max,
                    ),
                    GapBox(height:8, width: 0),
                    ConstrainedBox(
                        child: Text(
                          viewModel.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0x99000000),
                            fontSize: 12,
                          ),
                        ),
                        constraints: BoxConstraints(maxWidth: textWidth),
                    ),
                    GapBox(height:13, width: 0),
                    Text(
                      viewModel.info,
                      style: TextStyle(
                        color: Color(0x66000000),
                        fontSize: 12,
                      )
                    ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
              ),
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            ),
            flex: 1,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}


                