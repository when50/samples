import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';
import 'package:multiple_flutters_module/models/one_item_model.dart';
import 'package:multiple_flutters_module/view/category_desc_box.dart';
import 'package:multiple_flutters_module/view/category_filter_box.dart';
import 'package:multiple_flutters_module/view/category_one_item_box.dart';
import 'package:multiple_flutters_module/view_model/view_model.dart';

import 'view/four_item_box.dart';
import 'view/home_one_item_box.dart';

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
    ViewModel vm = ViewModel();

    _contentWidget = Center(
        child: 
        Column(
          children: [
            ConstrainedBox(
              child: CategoryOneItemBox(
                viewModel: vm.categoryItem,
              ),
              constraints: BoxConstraints(minHeight: 200),
            ),
            ConstrainedBox(
              child: CategoryDescBox(viewModel: vm.categoryDesc),
              constraints: BoxConstraints(minHeight: 54),
            ),
            ConstrainedBox(
              child: CategoryFilterBox(
                viewModel: vm.categoryFilter,
                selectedColor: Color(0xffff9510),
                normalColor: Color(0x99000000),
                childTapInvoke: (index) {
                  invokeChildTap(index);
                },
              ),
              constraints: BoxConstraints(minHeight: 38),
            ),
            FourItemsBox(vm.fourItems, (int childIndex) => invokeChildTap(0)),
            HomeOneItemBox(vm.oneItem, () => invokeTap())
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
              _contentWidget = FourItemsBox(model, (int childIndex) => invokeChildTap(childIndex));
              break;
            case "9":
              var model = OneItemModel.fromJson(modelMap);
              _contentWidget = HomeOneItemBox(model, () => invokeTap());
              break;
            case "categoryDesc":
              _contentWidget = CategoryDescBox(viewModel: ViewModel.categoryDescViewModel(modelMap));
              break;
            case "categoryFilter":
              _contentWidget = CategoryFilterBox(viewModel: ViewModel.categoryFilterViewModel(modelMap));
              break;
            case "categoryItem":
              _contentWidget = CategoryOneItemBox(viewModel: ViewModel.categoryItemViewModel(modelMap), tapInvoke: () => invokeTap());
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
    _channel.invokeMethod("clickView");
  }

  void invokeChildTap(int childIndex) {
    _channel.invokeMethod("clickComponent", childIndex);
  }
}