import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MessageView extends GetView {
  const MessageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'MessageView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
