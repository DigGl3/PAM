import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/course_details.dart';
import '../controllers/course_controller.dart';
import '../widgets/common/net_image.dart';
import '../widgets/common/state_view.dart';
import '../widgets/course/course_tab_button.dart';
import '../widgets/course/lesson_row.dart';

/// Ecranul Course Overview: afișează starea din [CourseController].
class CoursePage extends GetView<CourseController> {
  const CoursePage({super.key});

  static const _lessonTop = 460.0;
  static const _lessonSpacing = 70.0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Valorile reactive se citesc aici, în Obx, ca ecranul să se
      // reconstruiască la schimbarea stării sau a tab-ului.
      final state = controller.state.value;
      final selectedTab = controller.selectedTab.value;
      return StateView<CourseDetails>(
        state: state,
        onRetry: controller.loadDetails,
        background: const Color(0xFFF9FBFF),
        builder: (details) => _buildContent(context, details, selectedTab),
      );
    });
  }

  Widget _buildContent(
    BuildContext context,
    CourseDetails page,
    String selectedTab,
  ) {
    final c = controller;
    final course = page.course;
    final lessons = course.lessons;
    // Prima lecție deblocată și neterminată este evidențiată
    final current = course.currentLessonIndex;
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
                          onTap: c.goBack,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: NetImage(
                              page.navigation.backIconUrl,
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
                          page.navigation.title,
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
                              NetImage(course.hero.imageUrl),
                              if (course.hero.label.isNotEmpty)
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
                                      course.hero.label,
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
                            course.hero.playIconUrl,
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
                            for (var i = 0; i < course.tabs.items.length; i++) ...[
                              if (i > 0) const SizedBox(width: 36),
                              CourseTabButton(
                                text: course.tabs.items[i].label,
                                selected: selectedTab == course.tabs.items[i].id,
                                onTap: () => c.selectTab(course.tabs.items[i].id),
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
                            child: LessonRow(
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
                        page.actions.price.label,
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
                          color: page.actions.enroll.enabled
                              ? const Color(0xFFFF7401)
                              : const Color(0xFFD2D2D2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          page.actions.enroll.label,
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
