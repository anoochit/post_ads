import 'package:ads_carousel/app/data/models/post_item.dart';
import 'package:ads_carousel/app/data/providers/post_item_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //
  RxInt navIndex = 0.obs;

  RxList<PostItem> listPost = <PostItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    PostItemProvider().getPosts().then((value) {
      listPost.value = value.cast<PostItem>();
    });
  }
}
