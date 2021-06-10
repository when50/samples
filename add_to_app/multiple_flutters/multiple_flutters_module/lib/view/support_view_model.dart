import 'package:json_resolver/json_resolver.dart';

class SupportViewModel {
  Map<String, dynamic> data = {};
  Map<String, String> dataMap = {};

  T dataWithKey<T>(String key, T defaultValue) {
    if (dataMap[key] == null) {
      return defaultValue;
    }
    String dataKey = resolve(json: dataMap, path: key, defaultValue: "");
    if (dataKey == null) {
      return defaultValue;
    }
    return resolve(json: data, path: dataKey, defaultValue: defaultValue);
  }

  void setDataAndMap(Map<String, dynamic> data, Map<String, String> map) {
    this.data = data;
    this.dataMap = map;
  }
}