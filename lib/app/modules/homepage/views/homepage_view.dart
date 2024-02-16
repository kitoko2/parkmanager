import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/admin_user/custom_updateparking_bottonsheet.dart';
import 'package:parkmanager/app/components/admin_user/parking_button.dart';
import 'package:parkmanager/app/components/admin_user/place_widget.dart';
import 'package:parkmanager/app/modules/notification/views/notification_view.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ParkingButton(onTap: () {
              Get.bottomSheet(const BottomSheetUpdateParking());
            }),
            const Divider(),
            Expanded(
              // child: EmptyPlaceWidget(),
              child: GridView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return PlaceWidget(isbusy: i.isEven);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 90,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
