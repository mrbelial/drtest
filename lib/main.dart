import 'package:drtest/controllers/main_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/views/drug/drugs_screen.dart';
import 'package:drtest/views/situations/bmi_screen.dart';
import 'package:drtest/views/situations/ckd_screen.dart';
import 'package:drtest/views/situations/ld_screen.dart';
import 'package:drtest/views/situations/thrombocytopenia_screen.dart';
import 'package:drtest/views/test/endtest_screen.dart';
import 'package:drtest/views/test/test2_screen.dart';
import 'package:drtest/views/test/test3_screen.dart';
import 'package:drtest/views/test/test1_screen.dart';
import 'package:drtest/views/test/test4_screen.dart';
import 'package:drtest/views/test/test5_screen.dart';
import 'package:drtest/views/test/test_page_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainController());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 800,
    app: const MyApp(),
  );
  runApp(runnableApp);
}

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    // return app;
  }

  return Center(
    child: ClipRect(
      child: Container(
        color: AppColors.background,
        width: webAppWidth,
        child: app,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/aboutus', page: () => AboutUsScreen()),
        GetPage(name: '/aboutapp', page: () => const AboutAppScreen()),

        //Tests
        GetPage(name: '/test', page: () => TestScreen()),
        GetPage(name: '/test2', page: () => Test2Screen()),
        GetPage(name: '/test3', page: () => Test3Screen()),
        GetPage(name: '/test4', page: () => Test4Screen()),
        GetPage(name: '/test5', page: () => Test5Screen()),
        GetPage(name: '/endtest', page: () => EndTestScreen()),

        //Test Page
        GetPage(name: '/test_page', page: () => TestPageScreen()),

        //situations
        GetPage(name: '/ckd', page: () => CKDScreen()),
        GetPage(name: '/ld', page: () => LDScreen()),
        GetPage(name: '/bmi', page: () => BMIScreen()),
        GetPage(
            name: '/Thrombocytopenia', page: () => ThrombocytopeniaScreen()),

        //Drug
        GetPage(name: '/drugs', page: () => DrugsScreen()),
      ],
      theme: AppThemes.defaultTheme,
      home: SplashScreen(),
    );
  }
}
