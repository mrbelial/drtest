import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.initDashboard();

    return Obx(() {
      return Scaffold(
        body: _controller.currentPage.page,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.gray,
          selectedLabelStyle: AppTextStyles.subtitle3,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _controller.tabIndex,
          onTap: (index) => _controller.tabIndex = index,
          items: _controller.pages
              .map(
                  (e) => BottomNavigationBarItem(icon: Icon(e.icon), label: ""))
              .toList(),
        ),
      );
    });
  }
}
