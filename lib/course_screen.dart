import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/app_controller.dart';
import 'home_screen.dart';
import 'widgets/data_view.dart';
import 'widgets/net_image.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  static const _lessonTop = 460.0;
  static const _lessonSpacing = 70.0;

  @override
  Widget build(BuildContext context) {
    return DataView(
      background: const Color(0xFFF9FBFF),
      builder: (c) => _buildContent(context, c),
    );
  }

  Widget _buildContent(BuildContext context, AppController c) {
    final page = c.courseOverview;
    final course = page.course;
    final lessons = course.lessons;
    final selectedTab = c.selectedTab.value;
    // Prima lecție deblocată și neterminată este evidențiată (buton plin)
    final current = lessons.indexWhere((l) => !l.locked && !l.completed);
    final extraLessons = lessons.length > 4 ? lessons.length - 4 : 0;
    final size = MediaQuery.sizeOf(context);
    final top = MediaQuery.paddingOf(context).top;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final scale = size.width / 393;
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFF),
      body: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 393,
          height: size.height / scale,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 805 + extraLessons * _lessonSpacing + top,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 11,
                        top: 3 + top,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => Get.off(() => const HomeScreen()),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: NetImage(
                              page.backIconUrl,
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        top: 12 + top,
                        child: Text(
                          page.navigationTitle,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF2C2C2C),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 87 + top,
                        width: 335,
                        height: 207,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              NetImage(course.heroImageUrl),
                              if (course.heroLabel.isNotEmpty)
                                Positioned(
                                  left: 16,
                                  top: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xCCFFFFFF),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      course.heroLabel,
                                      style: GoogleFonts.roboto(
                                        color: const Color(0xFF2C2C2C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 176,
                        top: 164 + top,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 16,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: NetImage(
                            course.heroPlayIconUrl,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 328 + top,
                        child: Text(
                          course.title,
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF2C2C2C),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 364 + top,
                        child: Row(
                          children: [
                            NetImage(
                              page.uiIcons.durationIconUrl,
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              course.duration,
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF8C8C8C),
                                fontSize: 14,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                '·',
                                style: TextStyle(
                                  color: Color(0xFF8C8C8C),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            NetImage(
                              page.uiIcons.lessonsIconUrl,
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${course.lessonCount} lessons',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF8C8C8C),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 317,
                        top: 361 + top,
                        child: Container(
                          width: 54,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF4FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NetImage(
                                page.uiIcons.ratingIconUrl,
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                course.rating.toStringAsFixed(1),
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFFFF7401),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 407 + top,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < course.tabs.length; i++) ...[
                              if (i > 0) const SizedBox(width: 36),
                              _Tab(
                                text: course.tabs[i].label,
                                selected: selectedTab == course.tabs[i].id,
                                onTap: () => c.selectTab(course.tabs[i].id),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (selectedTab == 'lessons')
                        for (var i = 0; i < lessons.length; i++)
                          Positioned(
                            left: 36,
                            right: 32,
                            top: _lessonTop + i * _lessonSpacing + top,
                            child: _LessonRow(
                              title: lessons[i].title,
                              duration: '${lessons[i].duration} min',
                              filled: i == current,
                              locked: lessons[i].locked,
                              playIconUrl: lessons[i].playIconUrl,
                              arrowIconUrl: lessons[i].arrowIconUrl,
                            ),
                          ),
                      if (selectedTab == 'description')
                        Positioned(
                          left: 36,
                          right: 32,
                          top: _lessonTop + top,
                          child: Text(
                            course.description.isEmpty
                                ? 'No description available.'
                                : course.description,
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF8C8C8C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 120,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFF9FBFF).withValues(alpha: 0),
                          const Color(0xCFF9FBFF),
                          const Color(0xFFF9FBFF),
                        ],
                        stops: const [0, 0.05, 0.575],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                right: 22,
                bottom: bottom + 13,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFF2F2F2)),
                      ),
                      child: Text(
                        page.actions.priceLabel,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFFFF7401),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: page.actions.enrollEnabled
                              ? const Color(0xFFFF7401)
                              : const Color(0xFFD2D2D2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          page.actions.enrollLabel,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
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

class _LessonRow extends StatelessWidget {
  const _LessonRow({
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
        // Iconița de play din JSON (portocaliu / portocaliu deschis dacă e
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
