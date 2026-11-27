import 'package:flutter/material.dart';

import '../common/net_image.dart';

/// Clopoțelul de notificări (iconița din API) cu punct roșu dacă hasUnread.
class NotificationBell extends StatelessWidget {
  const NotificationBell({
    super.key,
    required this.iconUrl,
    required this.hasUnread,
  });

  final String iconUrl;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          NetImage(iconUrl, width: 28, height: 28),
          if (hasUnread)
            Positioned(
              right: 4,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5106),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
