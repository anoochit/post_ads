import 'package:ads_carousel/app/data/models/post_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdsPostView extends GetView {
  AdsPostView({Key? key, this.item}) : super(key: key);

  final List<Ad>? item;

  @override
  final AdsPostController controller = Get.put(AdsPostController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.showAds.value,
        child: Stack(
          children: [
            // ads items
            Container(
              height: 120,
              color: Colors.white,
              child: Stack(children: [
                PageView(
                  onPageChanged: (value) {
                    controller.currentPage.value = value;
                  },
                  children: item!
                      .map((e) => Row(
                            children: [
                              // image
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.network(e.image!),
                              ),

                              // text
                              Text(e.title!),
                            ],
                          ))
                      .toList(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: item!.asMap().entries.map((e) {
                        final index = e.key;

                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            (controller.currentPage.value == index)
                                ? Icons.circle
                                : Icons.circle_outlined,
                            size: 8,
                            color: Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ]),
            ),

            // button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  controller.showAds.value = !controller.showAds.value;
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdsPostController extends GetxController {
  //
  RxBool showAds = true.obs;
  RxInt currentPage = 0.obs;
}
