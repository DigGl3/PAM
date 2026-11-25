import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/app_data.dart';

/// Controller GetX care încarcă datele din assets/data/lab_v4.json
/// și le expune reactiv ecranelor (Obx).
class AppController extends GetxController {
  static const jsonPath = 'assets/data/lab_v4.json';

  final data = Rxn<AppData>();
  final isLoading = true.obs;
  final error = RxnString();

  /// Tab-ul selectat pe ecranul Course Overview ('lessons' / 'description').
  final selectedTab = ''.obs;

  HomePageData get home => data.value!.homePage;
  CourseOverviewPageData get courseOverview => data.value!.courseOverviewPage;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      error.value = null;
      final raw = await rootBundle.loadString(jsonPath);
      final parsed = AppData.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      data.value = parsed;
      selectedTab.value = parsed.courseOverviewPage.course.selectedTab;
    } catch (e) {
      error.value = 'Nu s-au putut încărca datele: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void selectTab(String id) => selectedTab.value = id;
}
