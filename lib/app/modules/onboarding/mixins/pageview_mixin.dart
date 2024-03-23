import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin PageViewMixin on GetTickerProviderStateMixin {
  late PageController bgPageController;

  void initPageController({required int length}) {
    bgPageController = PageController();
  }

  void slideBackgroundTo(int currentPage) {
    bgPageController.animateToPage(
      currentPage,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 470),
    );
  }

  void disposeTabController() {
    bgPageController.dispose();
  }
}
