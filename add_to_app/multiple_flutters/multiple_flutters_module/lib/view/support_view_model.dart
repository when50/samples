class SupportViewModel {
  Map<String, dynamic> data = {};
  Map<String, String> dataMap = {};

  dynamic dataWithKey(String key) {
    if (dataMap[key] == null) {
      return null;
    }
    String dataKey = dataMap[key];
    if (dataKey == null) {
      return null;
    }
    return data[dataKey];
  }

  void setDataAndMap(Map<String, dynamic> data, Map<String, String> map) {
    this.data = data;
    this.dataMap = map;
  }
}