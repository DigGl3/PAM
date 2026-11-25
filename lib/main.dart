import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// GetX Library
import 'package:get/get.dart';

// Design, controller and Home screen
import 'colors.dart';
import 'controllers/app_controller.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning',
      // Controllerul care încarcă datele din JSON, disponibil în toată aplicația
      initialBinding: BindingsBuilder(() {
        Get.put(AppController(), permanent: true);
      }),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: learningBlue),
        splashFactory: InkRipple.splashFactory,
      ),
      home: const HomeScreen(),
    );
  }
}
