import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multiple_flutters_module/view/support_tap.dart';
import 'package:multiple_flutters_module/view/support_view_model.dart';

class CategoryFilterBox extends StatefulWidget implements SupportChildTap {
  CategoryFilterBox({this.viewModel, this.normalColor, this.selectedColor, this.childTapInvoke});
  final SupportViewModel viewModel;
  final Color normalColor;
  final Color selectedColor;
  final Function(int) childTapInvoke;

  @override
  _CategoryFilterBoxState createState() => _CategoryFilterBoxState();

  @override
  void invokeTapChild(int atIndex) {
    childTapInvoke(atIndex);
  }
}

class _CategoryFilterBoxState extends State<CategoryFilterBox> {
  int selectedIndex = 0;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<dynamic> titles = widget.viewModel.dataWithKey("titles", []);
    List<SupportViewModel> titleViewModels = titles.map((e) {
      SupportViewModel vm = SupportViewModel();
      vm.setDataAndMap(Map<String, dynamic>.from(e), {"title": "filterText"});
      return vm;
    }).toList();
    return ConstrainedBox(
      child: ListView.separated(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: Text(
              titleViewModels[index].dataWithKey("title", "title_$index"),
              style: TextStyle(color: index == selectedIndex ? widget.selectedColor : widget.normalColor),
            ),
            onTap: () => selectedAt(index),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (BuildContext context, int index) {
          return VerticalDivider(color: Color(0x00000000), width: 34,);
        },
        itemCount: titleViewModels.length, 
        scrollDirection: Axis.horizontal,
      ),
      constraints: BoxConstraints(minHeight: 38, maxHeight: 38),
    );
  }

  void selectedAt(int index) {
    setState(() {
      selectedIndex = index;
      widget.invokeTapChild(index);
    });
  }
}