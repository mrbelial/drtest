import 'package:drtest/controllers/main_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'views/drug/drug_dosing_screen.dart';

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
        GetPage(name: '/endtest', page: () => EndTestScreen()),

        //Test Page
        GetPage(name: '/test_page', page: () => TestPageScreen()),

        //Test Calc
        GetPage(name: '/cha2ds2', page: () => CHA2DS2Screen()),
        GetPage(name: '/has_bled', page: () => HasBledScreen()),
        GetPage(name: '/cockcroft_gault', page: () => CockcroftGaultScreen()),
        GetPage(name: '/child_pugh', page: () => ChildPughScreen()),
        GetPage(name: '/platelet_count', page: () => PlateletCountScreen()),
        GetPage(name: '/bmi_calculator', page: () => BMICalculatorScreen()),

        //Drug
        GetPage(name: '/drugs', page: () => DrugsScreen()),
        GetPage(name: '/drug_dosing', page: () => DrugDosingScreen()),

        //test_situations_page
        GetPage(
            name: "/test_situations_page", page: () => TestSituationsScreen()),
      ],
      theme: AppThemes.defaultTheme,
      home: SplashScreen(),
    );
  }
}
