import 'package:flutter/material.dart';

class PageIndexResponse {
  int selectedIndex = 0;
  PageIndexModel get current => pages[selectedIndex];

  List<PageIndexModel> pages = [];

  PageIndexResponse({this.pages = const [], this.selectedIndex = 0});
}

class PageIndexModel {
  String title;
  String appbarTitle;
  IconData? icon;
  Widget page;
  int count;
  PageIndexModel({
    required this.title,
    required this.appbarTitle,
    required this.icon,
    required this.page,
    required this.count,
  });
}
