import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';
import 'package:multiple_flutters_module/models/one_item_model.dart';
import 'package:multiple_flutters_module/view/category_desc_box.dart';
import 'package:multiple_flutters_module/view/category_filter_box.dart';

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
    _contentWidget = Center(
        child: 
        Column(
          children: [
            ConstrainedBox(
              child: CategoryDescBox(desc: "zhizhujiao"),
              constraints: BoxConstraints(minHeight: 54),
            ),
            CategoryFilterBox(
              filterTitles: ["title0", "title1", "title2", "title3", "title4", "title5", "title6"],
              selectedColor: Color(0xffff9510),
              normalColor: Color(0x99000000),
              childTapInvoke: (index) {
                invokeChildTap(index);
              },
            ),
            FourItemsBox(FourtItems.fromJsonString(
              '''
              {
	"style": 10,
	"items": [{
		"title": "末日进化乐园",
		"cover": "http://s.dyreader.cn/g/60/68/1369472301122214444_360_480_poster.jpeg",
		"score": 8.1,
		"intro": "上一世，末世来临，他真诚善良，守护所有人，最终，却被人诬蔑为反人类的邪恶魔头，成为天下公敌，被人类所不容，谁也不知道，曾经走在抵挡末世异族最前线，为人类幸存者开辟出了生存基地的一代天骄，最后孤寂无声，死在一个潮湿的无名山洞中。当他再睁开眼时，却是，回到了十年前，末日来临的前一天！",
        "finish": false
    }, {
        "title": "我家后院通末世",
		"cover": "http://s.dyreader.cn/2020/06/17/1273148938049836611_95_360_480.jpeg",
		"score": 7.4,
		"intro": "因为一枚神秘戒指，误打误撞被传送到另外一个世界，确意外被美女姐妹花绑架。哪成想就在大难临头时，命运逆转。这才得以生还，当发现置身于平行世界时，宋超才知道这一切不是梦。",
		"finish": false
    }, {
        "score": 8.0,
        "title": "星空梦",
        "cover": "http://s.dyreader.cn/g3/93/df/1148598965586141184_360_480.jpg",
        "intro": "星空浩瀚， 时代进步的同时，危机步步逼近，地球上隐藏另一面也浮出水面，体术锻人之体，异能才是地球真正的力量，雷，火，光....灾难来临，李宅竭尽全力，却发现新的一切......天枢，天璇，天玑，天权，一解北斗七星之谜...遗落的古书的重聚，开启新的层面，世人却发现惊天秘密...不甘命运被操控，层面之战开启，最强的李宅与最强的“自己”交手，用尽全身力气嘶声力竭的向另一个层面宣誓心中不畏强权，世界上本没有奴隶，可是堕落的人多了，便出现了奴隶....原来一切.....",
        "finish": true
    }, {
      "title": "诡域档案",
					"cover": "http://s.dyreader.cn/g/77/f9/1277857910279395313_360_480.jpeg",
					"hcover": "",
					"score": 8.0,
					"intro": "六年前华夏国国家安全部优秀的侦察员、七局的副局长彭刚同志在执行任务的过程中离奇遇害，当时和他在一起的同志亲眼见到他就象是被人勒住了脖子一般，双手挥舞着，挣扎着，然后滚到了地上，便断了气，任凭战友怎么拉扯、阻止都无济于事，六年后几名侦察员相继失踪，而他们正在调查的案子透着十分的诡异，而且与六年前的案子也有着千丝万缕的联系。为此部领导责成第五局组建了一支名为“诡域”神秘调查组（五局九处），他们从侦察员的失踪案开始了对诡异领域发生的一系列案件的调查，诡异、恐怖、心理的搏弈，智慧的比拼……",
					"finish": true
    }]
}
              '''
            ), (int childIndex) => invokeChildTap(0)),
            HomeOneItemBox(OneItemModel.fromJsonString('''
            
				{
				"style": 9,
				"items": [{
					"title": "铁血英雄",
					"cover": "http://s.dyreader.cn/g/60/98/1377825555996497774_360_480_poster.jpeg",
					"hcover": "",
					"score": 8.1,
					"intro": "1937，炮火纷飞，日寇侵略中华！刘杨意外穿越战场，带领残破的队伍走出惨败；不愿后撤，刘杨脱离大部队，在太湖组建抗日武装；但有一息尚存，绝不苟且偷生！本书没有金手指，仅以七尺血肉，护我中华山河！谨以此书先给抗日战争中流血牺牲的先辈们。",
					"finish": true
				}]
			}
            '''), () => invokeTap())
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