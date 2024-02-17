import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  final bool? isAdmin;
  const BookingView({Key? key, this.isAdmin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              isAdmin! ? 'Reservations reçues' : "Reservations effectuées"),
          centerTitle: true,
        ),
        body: Column(
          children: [],
        ));
  }
}
