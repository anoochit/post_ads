import 'package:ads_carousel/app/modules/home/controllers/home_controller.dart';
import 'package:ads_carousel/app/modules/home/views/post_item_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeedView extends GetView<HomeController> {
  const FeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.listPost.length,
        itemBuilder: (BuildContext context, int index) {
          return PostItemView(item: controller.listPost[index]);
        },
      ),
    );
  }
}
