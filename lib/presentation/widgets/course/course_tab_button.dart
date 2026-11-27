import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Un tab (Lessons / Description) cu linie sub cel selectat.
class CourseTabButton extends StatelessWidget {
  const CourseTabButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? const Color(0xFFFF7401)
        : const Color(0xFFD2D2D2);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 100,
            height: 2,
            color: selected ? const Color(0xFFFF7401) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
