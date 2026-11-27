import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/feed.dart';

/// Cardul „Learned today” cu progresul zilnic.
class TodayCard extends StatelessWidget {
  const TodayCard({
    super.key,
    required this.data,
    required this.actionLabel,
    required this.onCourses,
  });

  final LearnedToday data;
  final String actionLabel;
  final VoidCallback onCourses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.title,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF858597),
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onCourses,
                child: Text(
                  actionLabel,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF3D5CFF),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${data.learnedMinutes}min',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1F1F39),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '  / ${data.goalMinutes}min',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF858597),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              height: 6,
              width: double.infinity,
              child: Stack(
                children: [
                  const ColoredBox(
                    color: Color(0xFFF4F3FD),
                    child: SizedBox.expand(),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: data.progress.clamp(0.0, 1.0),
                    child: Container(
                      height: 6,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00FFFFFF), Color(0xFFFF5106)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
