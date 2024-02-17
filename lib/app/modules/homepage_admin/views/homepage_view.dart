import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parkmanager/app/components/admin_user/custom_updateparking_bottonsheet.dart';
import 'package:parkmanager/app/components/admin_user/parking_button.dart';
import 'package:parkmanager/app/components/admin_user/place_widget.dart';
import 'package:parkmanager/app/modules/homepage_admin/views/empty_place_widget.dart';
import 'package:parkmanager/app/modules/notification/views/notification_view.dart';
import 'package:parkmanager/app/services/parking_service.dart/parking_management.dart';

import '../controllers/homepage_controller.dart';

class HomepageAdminView extends GetView<HomepageAdminController> {
  const HomepageAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageAdminController());
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
            StreamBuilder(
                stream: ParkingManagementService.getParkingPlacesByAdminId(
                    controller.uid),
                builder: (context, snap) {
                  print(snap);
                  if (snap.hasData) {
                    final data = snap.data;
                    print(data);
                    return Expanded(
                      // child: EmptyPlaceWidget(),
                      child: data == null || data.isEmpty
                          ? const EmptyPlaceWidget()
                          : GridView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                return PlaceWidget(isbusy: i.isEven);
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 90,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                            ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
