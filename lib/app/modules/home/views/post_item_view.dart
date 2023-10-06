import 'package:ads_carousel/app/data/models/post_item.dart';
import 'package:ads_carousel/app/modules/home/views/ads_post_view.dart';
import 'package:flutter/material.dart';

class PostItemView extends StatelessWidget {
  const PostItemView({Key? key, required this.item}) : super(key: key);
  final PostItem item;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              // avatar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(item.user!.avatarUrl!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.user!.name}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text('${item.datetime}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // post body
              Container(
                color: Colors.white,
                width: constraints.maxWidth,
                height: constraints.maxWidth,
                child: (item.type == "image")
                    ? Image.network(
                        item.content!,
                        fit: BoxFit.cover,
                      )
                    : FittedBox(
                        fit: BoxFit.contain,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.content!),
                        ),
                      ),
              ),

              // ads
              (item.ads!.isNotEmpty) ? AdsPostView(item: item.ads) : Container()
            ],
          ),
        ),
      );
    });
  }
}
