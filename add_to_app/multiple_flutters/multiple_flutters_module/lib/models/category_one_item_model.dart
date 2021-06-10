
class CategoryOneItemModel {
  CategoryOneItemModel({this.imageWidth, this.imageUrl, this.title, this.desc, this.info, this.score});
  final double imageWidth;
  final String imageUrl;
  final String title;
  final String desc;
  final String info;
  final String score;

  double cellHeight() {
    return 20 + imageWidth * 4 / 3;
  }
}