import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/net_image.dart';

/// Un rând din lista de lecții.
class LessonRow extends StatelessWidget {
  const LessonRow({
    super.key,
    required this.title,
    required this.duration,
    required this.filled,
    required this.playIconUrl,
    required this.arrowIconUrl,
    this.locked = false,
  });

  final String title;
  final String duration;
  final bool filled;
  final bool locked;
  final String playIconUrl;
  final String arrowIconUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Iconița de play din API (portocaliu / portocaliu deschis dacă e
        // blocată). Lecția curentă primește un fundal portocaliu deschis.
        Container(
          width: 46,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: filled ? const Color(0xFFFFEBDD) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: NetImage(playIconUrl, width: 44, height: 44),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: locked
                      ? const Color(0xFFAEAEAE)
                      : const Color(0xFF2C2C2C),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                duration,
                style: GoogleFonts.roboto(
                  color: const Color(0xFFAEAEAE),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        NetImage(arrowIconUrl, width: 28, height: 28),
      ],
    );
  }
}
