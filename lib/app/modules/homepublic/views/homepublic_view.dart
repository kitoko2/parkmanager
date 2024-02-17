import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepublic_controller.dart';

class HomepublicView extends GetView<HomepublicController> {
  const HomepublicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomepublicView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomepublicView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
