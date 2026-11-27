import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Al doilea card din lista orizontală (ilustrație locală, nu vine din API).
class SecondCard extends StatelessWidget {
  const SecondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 249,
        height: 154,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/second_card.svg',
              width: 249,
              height: 154,
            ),
            Positioned(
              left: 18.7,
              top: 25.8,
              child: SvgPicture.asset(
                'assets/images/second_illu.svg',
                width: 162.787,
                height: 117.491,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
