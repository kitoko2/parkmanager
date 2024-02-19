import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:parkmanager/app/components/admin_user/accept_reservation_bottomsheet.dart';
import 'package:parkmanager/app/components/empty_reservation_widget.dart';
import 'package:parkmanager/app/models/reservatiom_model.dart';
import 'package:parkmanager/app/services/reservation_service/reservation_service.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  final bool? isAdmin;
  const BookingView({Key? key, this.isAdmin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title:
            Text(isAdmin! ? 'Reservations reçues' : "Reservations effectuées"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: FutureBuilder(
          future: isAdmin == true
              ? ReservationService.getAdminReservations(id)
              : ReservationService.getPublicUserReservations(id),
          builder: (context, snap) {
            if (snap.hasData) {
              final data = snap.data;
              log(data.toString());
              return data == null || data.isEmpty
                  ? EmptyReservationWidget(
                      isAdmin: isAdmin,
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        final reservation = data[i];
                        return ReservationWidget(
                          reservation: reservation,
                          onTap: isAdmin == true
                              ? () {
                                  if (reservation.status == "pending") {
                                    Get.bottomSheet(
                                        AcceptReservationBottomSheet(
                                      reservation: reservation,
                                    ));
                                  }
                                }
                              : null,
                        );
                      },
                    );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class ReservationWidget extends StatelessWidget {
  final Reservation reservation;
  final VoidCallback? onTap;
  const ReservationWidget({super.key, required this.reservation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade100),
            child: const Icon(
              IconlyLight.bookmark,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Demande de reservation pendant ${reservation.numberOfHours}h",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Détails : " "Place ${reservation.detailPlace ?? "_"}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Réservation Faite le " "${reservation.timestamp ?? "_"}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Statut : " "${reservation.status ?? "_"}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    )

        // ListTile(
        //   leading: const Icon(IconlyLight.bookmark),
        //   onTap: onTap,
        //   minLeadingWidth: 10,
        //   title: Text(
        //     "Demande de reservation pour ${reservation.numberOfHours}h",
        //     maxLines: 1,
        //     overflow: TextOverflow.ellipsis,
        //     style: const TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        //   subtitle: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Détails : " "Place ${reservation.detailPlace ?? "_"}",
        //         style: const TextStyle(fontSize: 12),
        //       ),
        //       Text(
        //         reservation.status ?? "_",
        //         style: const TextStyle(fontSize: 12, color: Colors.grey),
        //       ),
        //       Divider()
        //     ],
        //   ),
        // ),
        );
  }
}
