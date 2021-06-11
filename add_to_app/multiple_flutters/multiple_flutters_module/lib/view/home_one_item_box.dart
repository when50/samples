import 'package:flutter/material.dart';
import 'package:multiple_flutters_module/models/one_item_model.dart';
import 'package:multiple_flutters_module/view/support_tap.dart';

class HomeOneItemBox extends StatelessWidget implements SupportTap {
  final OneItemModel model;
  final Function tapInvoke;
  HomeOneItemBox(this.model, this.tapInvoke);

  @override
  Widget build(BuildContext context) {
    num imgWidth = (MediaQuery.of(context).size.width - 115) / 4;
    num textWidth = (MediaQuery.of(context).size.width - 35 - imgWidth - 55);
    return Padding(
      child: GestureDetector(
        child: OneItemContentBox(imgWidth, textWidth, model),
        onTap: () => invokeTap()
      ),
      padding: EdgeInsets.symmetric(horizontal: 35),
    );
  }

  @override
  void invokeTap() {
    tapInvoke();
  }
}

class OneItemContentBox extends StatelessWidget {
  num imgWidth;
  num textWidth;
  OneItemModel model;
  OneItemContentBox(this.imgWidth, this.textWidth, this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Image(
            image: NetworkImage(model.items.first.cover),
            width: imgWidth,
          ),
          Padding(
            child: ConstrainedBox(
              child:Column(
                children: [
                  Text(
                    model.items.first.title,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "当生命最后的时刻，姜明脑海里的记忆走马灯一般回放着，却意外重生于末日三天前。末世十五年的惨痛经历历历在目，姜明想要像个人一样活下去，在这险象环生的世界里保护自己想要保护的一切。这个世界为什么会变成这样？人类真的不过是高纬度文明手中的实验品吗？亦或者整个地球都是他们的斗兽场，人类只不过是为了供他们取乐而存在的？",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      
                    ),
                  ),
                  Text("逗号·都市·175万字·连载中")
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              constraints: BoxConstraints(maxWidth: textWidth),
            ),
            padding: EdgeInsets.only(left: 15),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      );
  }
}