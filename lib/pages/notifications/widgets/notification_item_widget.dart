import 'package:bbrecon/models/notifications/notifications_model.dart';
import 'package:bbrecon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({this.notification, this.onDelete});

  final NotificationItem notification;
  final Function(NotificationItem) onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onDelete?.call(notification);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.10),
              blurRadius: 25,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: toBeginningOfSentenceCase(notification.program),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  DateUtils.dateTimeAgo(notification.createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                notification.webhook,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
