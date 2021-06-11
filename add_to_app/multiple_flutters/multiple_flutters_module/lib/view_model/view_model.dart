import 'package:multiple_flutters_module/models/category_one_item_model.dart';
import 'package:multiple_flutters_module/models/four_item_model.dart';
import 'package:multiple_flutters_module/models/one_item_model.dart';
import 'package:multiple_flutters_module/view/support_view_model.dart';
import 'dart:convert';

class ViewModel {
  static SupportViewModel categoryDescViewModel(Map<String, dynamic> data) {
    dynamic raw = json.decode(
      '''
        {
          "desc": "channelFilterDesc"
        }
      '''
    );
    Map<String, String> map = Map<String, String>.from(raw);
    return SupportViewModel(data: data, dataMap: map);
  }

  static SupportViewModel categoryFilterViewModel(Map<String, dynamic> data) {
    dynamic raw = json.decode(
      '''
        {
          "titles": "itemViewModels"
        }
      '''
    );
    Map<String, String> map = Map<String, String>.from(raw);
    return SupportViewModel(data: data, dataMap: map);
  }

  static SupportViewModel categoryItemViewModel(Map<String, dynamic> data) {
    dynamic raw = json.decode(
      '''
        {
          "posterUrl": "itemPic",
          "title": "itemTitle",
          "score": "itemScore",
          "intro": "dataModel.intro",
          "info": "itemInfo"
        }
      '''
    );
    Map<String, String> map = Map<String, String>.from(raw);
    return SupportViewModel(data: data, dataMap: map);
  }

  SupportViewModel categoryDesc = (){
    dynamic raw = json.decode(
      '''
      {
        "channelFilterDesc":"作品主角大多为特种兵，铁血坚毅"
      }
      '''
    );
    Map<String, dynamic> data = Map<String, dynamic>.from(raw);
    return categoryDescViewModel(data);
  }();
  
    

  SupportViewModel categoryFilter = (){
    dynamic raw = json.decode(
      '''
      {
            "itemViewModels":[
                {
                    "filterText":"全部",
                    "filterLabelIsSelected":false,
                    "filterItemsModel":{
                        "selected":0,
                        "name":"全部",
                        "id":""
                    }
                },
                {
                    "filterText":"男",
                    "filterLabelIsSelected":false,
                    "filterItemsModel":{
                        "selected":0,
                        "name":"男",
                        "id":"10000"
                    }
                },
                {
                    "filterText":"女",
                    "filterLabelIsSelected":true,
                    "filterItemsModel":{
                        "selected":1,
                        "name":"女",
                        "id":"20000"
                    }
                }
            ],
            "filterType":1,
            "filterCellHeight":38
        }
      '''
    );
    Map<String, dynamic> data = Map<String, dynamic>.from(raw);
    return categoryFilterViewModel(data);
  }();

  SupportViewModel categoryItem = () {
    dynamic raw = json.decode(
      '''
      {
            "itemInfo":"秋微·106万字·已完结",
            "itemTitle":"重生欢宠：七少撩妻有道",
            "dataModel":{
                "siteType":0,
                "chapterCount":0,
                "pay":0,
                "words":1059359,
                "readerNum":94144,
                "searchPercent":0,
                "score":"8.3999996185302734",
                "intro":"前世的杨丹颜被渣男和小三联手算计，一尸两命，父母也受连累死于非命，当她以为自己已深处地狱时，却发现自己重生了，还躺在了江城首富云暮城的床上，还翻云覆雨了一番，醒来后悄咪咪赶紧溜了。 ",
                "cover":"http://s.dyreader.cn/2019/08/30/1143713283363282944_360_480.jpeg",
                "majorRoles":[
                    "杨丹颜",
                    "云暮城",
                    "齐天楚"
                ],
                "authors":[
                    "秋微"
                ],
                "sourceName":"鲸鱼阅读",
                "alias":[

                ],
                "name":"重生欢宠：七少撩妻有道",
                "detailUrl":"",
                "id":"1143713283363282944",
                "sourceId":"40",
                "finish":true,
                "bookType":1,
                "displayTag":[
                    {
                        "name":"老书虫都在读",
                        "id":"22863"
                    },
                    {
                        "name":"手撕绿茶",
                        "id":"22909"
                    }
                ]
            },
            "itemPic":"http://s.dyreader.cn/2019/08/30/1143713283363282944_360_480.jpeg",
            "itemDesc":"前世的杨丹颜被渣男和小三联手算计，一尸两命，父母也受连累死于非命，当她以为自己已深处地狱时，却发现自己重生了，还躺在了江城首富云暮城的床上，还翻云覆雨了一番，醒来后悄咪咪赶紧溜了",
            "itemScore":"8.4分"
        }
      '''
    );
    Map<String, dynamic> data = Map<String, dynamic>.from(raw);
    return categoryItemViewModel(data);
  }();

  FourtItems fourItems = (){
    return FourtItems.fromJsonString(
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
            );
  }();

  OneItemModel oneItem =  (){
            return OneItemModel.fromJsonString('''
            
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
            ''');
  }();
}