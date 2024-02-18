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
    return ListTile(
      leading: const Icon(IconlyLight.bookmark),
      onTap: onTap,
      minLeadingWidth: 10,
      title: Text(
        "Demande de reservation pour ${reservation.numberOfHours}h",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Détail de la place : " "${reservation.detailPlace ?? "Aucun"}",
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            reservation.status ?? "_",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Divider()
        ],
      ),
    );
  }
}
