import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'course_screen.dart';
import 'models/app_data.dart';
import 'widgets/data_view.dart';
import 'widgets/net_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openCourse() => Get.off(() => const CourseScreen());

  @override
  Widget build(BuildContext context) {
    return DataView(
      background: Colors.white,
      builder: (c) => _buildContent(context, c.home),
    );
  }

  Widget _buildContent(BuildContext context, HomePageData home) {
    final top = MediaQuery.paddingOf(context).top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColoredBox(
                color: const Color(0xFF3D5CFF),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, top + 17, 20, 62),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              home.header.greeting,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            Text(
                              home.header.subtitle,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _Bell(
                        iconUrl: home.header.notificationIconUrl,
                        hasUnread: home.header.hasUnreadNotification,
                      ),
                      const SizedBox(width: 12),
                      ClipOval(
                        child: NetImage(
                          home.header.avatarUrl,
                          width: 44,
                          height: 44,
                          placeholderColor: const Color(0x33FFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -46),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _TodayCard(
                        data: home.learnedToday,
                        actionLabel: home.myCourses.actionLabel,
                        onCourses: _openCourse,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 154,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 20),
                        children: [
                          _LearnCard(
                            data: home.learningPrompt,
                            onStart: _openCourse,
                          ),
                          const SizedBox(width: 12),
                          const _SecondCard(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        home.learningPlan.title,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1F1F39),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _PlanCard(items: home.learningPlan.items),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _MeetupCard(data: home.meetup),
                    ),
                    const SizedBox(height: 24),
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

class _TodayCard extends StatelessWidget {
  const _TodayCard({
    required this.data,
    required this.actionLabel,
    required this.onCourses,
  });

  final LearnedTodayData data;
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

class _LearnCard extends StatelessWidget {
  const _LearnCard({required this.data, required this.onStart});

  final LearningPromptData data;
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

class _SecondCard extends StatelessWidget {
  const _SecondCard();

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

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.items});

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
            _PlanRow(
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

class _PlanRow extends StatelessWidget {
  const _PlanRow({
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

class _MeetupCard extends StatelessWidget {
  const _MeetupCard({required this.data});

  final MeetupData data;

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

/// Clopoțelul de notificări (iconița din JSON) cu punct roșu dacă hasUnread.
class _Bell extends StatelessWidget {
  const _Bell({required this.iconUrl, required this.hasUnread});

  final String iconUrl;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          NetImage(iconUrl, width: 28, height: 28),
          if (hasUnread)
            Positioned(
              right: 4,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5106),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
