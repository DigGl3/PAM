import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/feed.dart';
import '../common/net_image.dart';

/// Cardul „What do you want to learn today?” cu butonul Get Started.
class LearnCard extends StatelessWidget {
  const LearnCard({
    super.key,
    required this.data,
    required this.onStart,
  });

  final LearningPrompt data;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 249,
        height: 154,
        child: Stack(
          children: [
            const ColoredBox(
              color: Color(0xFFCEECFE),
              child: SizedBox.expand(),
            ),
            Positioned(
              left: 18,
              top: 20,
              right: 108,
              child: Text(
                data.title,
                maxLines: 3,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1F1F39),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 100,
              child: NetImage(data.imageUrl),
            ),
            Positioned(
              left: 18,
              top: 104,
              child: GestureDetector(
                onTap: onStart,
                child: Container(
                  width: 85,
                  height: 31,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6905),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    data.actionLabel,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
