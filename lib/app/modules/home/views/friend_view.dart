import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendView extends GetView {
  const FriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'FriendView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
