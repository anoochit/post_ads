import 'package:get/get.dart';

import '../models/post_item.dart';

class PostItemProvider extends GetConnect {
  Future<List<PostItem>> getPosts() async {
    final result = await get(
        'https://gist.githubusercontent.com/anoochit/38ee10e1f596da3204afd5f0eaf1d844/raw/33b911a01b03e6e06d3cbba561a7dd94252ac4fe/post_items.json');

    // log('${result.bodyString}');

    return postItemFromJson(result.bodyString!);
  }
}
