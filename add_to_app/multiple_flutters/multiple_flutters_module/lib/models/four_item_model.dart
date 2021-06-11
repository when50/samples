import 'dart:convert';

class FourtItems {
  int style;
  List<Items> items;

  FourtItems({this.style, this.items});

  FourtItems.fromJsonString(String json) {
    Map<String, dynamic> map = Map<String, dynamic>.from(jsonDecode(json));
    style = map['style'];
    if (map['items'] != null) {
      items = new List<Items>();
      map['items'].forEach((v) {
        var itemsMap = new Map<String, dynamic>.from(v);
        items.add(new Items.fromJson(itemsMap));
      });
    }
  }

  FourtItems.fromJson(Map<String, dynamic> json) {
    style = json['style'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        var itemsMap = new Map<String, dynamic>.from(v);
        items.add(new Items.fromJson(itemsMap));
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

class Items {
  String cover;
  String title;

  Items(
      {this.cover, this.title});

  Items.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    title = json['title'];
    // score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['title'] = this.title;
    // data['score'] = this.score;
    return data;
  }
}