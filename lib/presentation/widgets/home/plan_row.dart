import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/net_image.dart';

/// Un rând din Learning Plan: iconiță, titlu și progres.
class PlanRow extends StatelessWidget {
  const PlanRow({
    super.key,
    required this.icon,
    required this.title,
    required this.done,
    required this.total,
  });

  final String icon;
  final String title;
  final String done;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NetImage(icon, width: 18, height: 18),
        const SizedBox(width: 13),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFF1F1F39),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: done,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: total,
                style: GoogleFonts.poppins(
                  color: const Color(0xFFB8B8D2),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
