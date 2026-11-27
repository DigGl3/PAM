import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/feed.dart';
import '../controllers/home_controller.dart';
import '../widgets/common/net_image.dart';
import '../widgets/common/state_view.dart';
import '../widgets/home/learn_card.dart';
import '../widgets/home/meetup_card.dart';
import '../widgets/home/notification_bell.dart';
import '../widgets/home/plan_card.dart';
import '../widgets/home/second_card.dart';
import '../widgets/home/today_card.dart';

/// Ecranul Home. Nu conține logică de business: afișează starea din
/// [HomeController] și îi transmite acțiunile utilizatorului.
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StateView<Feed>(
        state: controller.state.value,
        onRetry: controller.loadFeed,
        builder: (feed) => _buildContent(context, feed),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Feed home) {
    final top = MediaQuery.paddingOf(context).top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          // trage în jos pentru a reîncărca datele din API
          onRefresh: controller.refreshFeed,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                        NotificationBell(
                          iconUrl: home.header.notification.iconUrl,
                          hasUnread: home.header.notification.hasUnread,
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
                        child: TodayCard(
                          data: home.learnedToday,
                          actionLabel: home.myCourses.actionLabel,
                          onCourses: controller.openCourse,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 154,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          children: [
                            LearnCard(
                              data: home.learningPrompt,
                              onStart: controller.openCourse,
                            ),
                            const SizedBox(width: 12),
                            const SecondCard(),
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
                        child: PlanCard(items: home.learningPlan.items),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MeetupCard(data: home.meetup),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
