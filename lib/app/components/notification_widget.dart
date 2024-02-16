import 'package:flutter/material.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../models/notif_model.dart';

class CustomNotificationWidget extends StatefulWidget {
  final NotificationModel notif;
  final VoidCallback onTap;
  final VoidCallback onDismissDelete;
  final bool isRead;

  const CustomNotificationWidget(
      {super.key,
      required this.notif,
      required this.onTap,
      required this.isRead,
      required this.onDismissDelete});

  @override
  State<CustomNotificationWidget> createState() =>
      _CustomNotificationWidgetState();
}

class _CustomNotificationWidgetState extends State<CustomNotificationWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Dismissible(
      key: UniqueKey(),
      // onDismissed: (direction) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text('La notification a été supprimé'),
      //     ),
      //   );
      // },
      confirmDismiss: (_) async {
        widget.onDismissDelete();
        return true;
      },
      child: ZoomTapAnimation(
        end: 1,
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Badge(
                    backgroundColor: ConstantColors.primaryColor,
                    isLabelVisible: !widget.isRead,
                    child: Hero(
                      tag: widget.notif.sId.toString(),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.notif.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.notif.body,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
