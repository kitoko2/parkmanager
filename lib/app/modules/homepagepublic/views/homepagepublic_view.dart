import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/modules/notification/views/notification_view.dart';

import '../controllers/homepagepublic_controller.dart';

class HomepagepublicView extends GetView<HomepagepublicController> {
  const HomepagepublicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const NotificationView());
            },
            icon: const Icon(Icons.notification_add),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
