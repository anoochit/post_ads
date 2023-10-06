import 'package:ads_carousel/app/data/menu_item_model.dart';
import 'package:ads_carousel/app/modules/home/controllers/home_controller.dart';
import 'package:ads_carousel/app/modules/home/views/alert_button_view.dart';
import 'package:ads_carousel/app/modules/home/views/feed_view.dart';
import 'package:ads_carousel/app/modules/home/views/friend_view.dart';
import 'package:ads_carousel/app/modules/home/views/message_view.dart';
import 'package:ads_carousel/app/modules/home/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Network'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          AlertButtonView(),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.navIndex.value,
          children: const [
            FeedView(),
            FriendView(),
            MessageView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
            selectedIndex: controller.navIndex.value,
            onDestinationSelected: (value) {
              controller.navIndex.value = value;
            },
            destinations: listMenus
                .map((e) =>
                    NavigationDestination(icon: Icon(e.icon), label: e.title))
                .toList()),
      ),
    );
  }
}
