import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';
// import '../../tools/core.dart';

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
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.textColor4,
          unselectedItemColor: AppColors.gray,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          enableFeedback: false,
          currentIndex: _controller.tabIndex,
          onTap: (index) {
            _controller.tabIndex = index;
          },
          items: _controller.pages
              .map((e) => BottomNavigationBarItem(
                  icon: Image.asset(
                    iconPath(e.icon),
                    height: 30,
                    color: _controller.tabIndex == e.index
                        ? AppColors.textColor4
                        : null,
                  ),
                  label: e.title))
              .toList(),
        ),
      );
    });
  }
}
