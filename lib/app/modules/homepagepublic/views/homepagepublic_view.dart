import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/admin_user/place_widget.dart';
import 'package:parkmanager/app/components/empty_place_widget.dart';
import 'package:parkmanager/app/modules/notification/views/notification_view.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

import '../controllers/homepagepublic_controller.dart';

class HomepagepublicView extends StatefulWidget {
  const HomepagepublicView({Key? key}) : super(key: key);

  @override
  State<HomepagepublicView> createState() => _HomepagepublicViewState();
}

class _HomepagepublicViewState extends State<HomepagepublicView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepagepublicController());
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
            Text(
              "Vous recherchez une place disponible pour vous garez?",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontFamily: ConstantString.secondpoliceApp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            SearchBar(
              elevation: const MaterialStatePropertyAll(0.7),
              hintText: "Quel étage souhaitez vous?",
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  setState(() {});
                }
              },
              controller: controller.searchEditController,
              hintStyle: MaterialStatePropertyAll(
                controller.styleSearch.copyWith(color: Colors.grey),
              ),
              textStyle: MaterialStatePropertyAll(controller.styleSearch),
              leading: const Icon(
                IconlyLight.search,
                color: ConstantColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder(
                stream: controller.searchParkingPlacesByEtage(),
                builder: (context, snap) {
                  print(snap);
                  if (snap.hasData) {
                    final data = snap.data;
                    print("Result search parking place : $data");
                    return Expanded(
                      child: data == null || data.isEmpty
                          ? const EmptyPlaceWidget(
                              isAdmin: false,
                            )
                          : GridView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                final place = data[i];
                                return PlaceWidget(
                                  parkingPlace: place,
                                );
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
