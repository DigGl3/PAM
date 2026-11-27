import 'package:flutter/material.dart';

import '../../../domain/entities/feed.dart';
import 'plan_row.dart';

/// Cardul „Learning Plan” cu lista de cursuri.
class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.items,
  });

  final List<LearningPlanItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(height: 17),
            PlanRow(
              icon: items[i].progressIconUrl,
              title: items[i].title,
              done: '${items[i].completed}',
              total: '/${items[i].total}',
            ),
          ],
        ],
      ),
    );
  }
}
