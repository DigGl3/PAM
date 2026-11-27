import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/feed.dart';
import '../common/net_image.dart';

/// Cardul „Meetup”.
class MeetupCard extends StatelessWidget {
  const MeetupCard({
    super.key,
    required this.data,
  });

  final Meetup data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE0FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 21,
            top: 27,
            child: Text(
              data.title,
              style: GoogleFonts.poppins(
                color: const Color(0xFF440687),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ),
          Positioned(
            left: 22.7,
            top: 55.1,
            right: 122,
            child: Text(
              data.subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: const Color(0xFF440687),
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 110,
            child: NetImage(data.imageUrl),
          ),
        ],
      ),
    );
  }
}
