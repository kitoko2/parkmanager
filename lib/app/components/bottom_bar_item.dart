import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

Widget bottomAppBarItem(BuildContext context,
    {required icon,
    required page,
    required currentPage,
    required label,
    required VoidCallback onTap}) {
  return ZoomTapAnimation(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentPage == page ? Colors.black : Colors.grey,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
                color: currentPage == page ? Colors.black : Colors.grey,
                fontSize: 13,
                fontWeight: currentPage == page ? FontWeight.w600 : null),
          ),
        ],
      ),
    ),
  );
}
