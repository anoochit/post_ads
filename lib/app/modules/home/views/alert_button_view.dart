import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AlertButtonView extends GetView {
  const AlertButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //
      },
      icon: Badge.count(
        count: 3,
        child: const Icon(Icons.notifications),
      ),
    );
  }
}
