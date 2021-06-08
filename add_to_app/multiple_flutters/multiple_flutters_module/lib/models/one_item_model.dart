import 'four_item_model.dart';
import 'dart:convert';

class OneItemModel {
  int style;
  List<Items> items;

  OneItemModel({this.style, this.items});


  OneItemModel.fromJsonString(String json) {
    Map<String, dynamic> map = new Map<String, dynamic>.from(jsonDecode(json));
    style = map['style'];
    if (map['items'] != null) {
      items = new List<Items>();
      map['items'].forEach((v) {
        var vMap = new Map<String, dynamic>.from(v);
        items.add(new Items.fromJson(vMap));
      });
    }
  }

  OneItemModel.fromJson(Map<String, dynamic> json) {
    style = json['style'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        var vMap = new Map<String, dynamic>.from(v);
        items.add(new Items.fromJson(vMap));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['style'] = this.style;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

