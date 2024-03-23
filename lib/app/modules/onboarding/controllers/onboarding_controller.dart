import 'dart:ui';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../mixins/next_animation_mixin.dart';
import '../mixins/page_mixin.dart';
import '../mixins/pageview_mixin.dart';
import '../mixins/responsive_mixin.dart';
import '../mixins/scale_animation_mixin.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController
    with
        GetTickerProviderStateMixin,
        ScaleAnimationMixin,
        PageViewMixin,
        PageMixin,
        NextAnimationMixin,
        ResponsiveMixin {
  late RxString backgroundImagePath, headline, body;

  List<OnboardingModel> onboardingPages = OnboardingModel.onboardingPages;

  late Rx<Color> color1, color2;
  Rx<int> currentPage = 0.obs;
  Rx<Color> filterColor = const Color(0x00b7dfd9).withOpacity(.6).obs;

  Color activeColor = AppColors.primaryColor;
  Color inactiveColor = AppColors.primaryColor.withOpacity(.1);

  final colorTransitionDuration = const Duration(milliseconds: 700);

  final _page1 = 0;
  final _page2 = 1;

  void _updateColor1() {
    if (currentPage.value == _page1) {
      color1.value = activeColor;
    } else {
      color1.value = inactiveColor;
    }
    update();
  }

  void _updateColor2() {
    if (currentPage.value == _page2) {
      color2.value = activeColor;
    } else {
      color2.value = inactiveColor;
    }
    update();
  }

  void initColor() {
    color1 = activeColor.obs;
    color2 = inactiveColor.obs;
  }

  void updateColor() {
    if (currentPage.value == page1) {
      currentPage.value = page2;
    } else {
      currentPage.value = page1;
    }
    _updateColor1();
    _updateColor2();
    update();
  }

  void initOnboardingPage() {
    backgroundImagePath = onboardingPages[0].backgroundImagePath.obs;
    headline = onboardingPages[0].headline.obs;
    body = onboardingPages[0].body.obs;
  }

  void updateOnboardingPage() {
    backgroundImagePath.value =
        onboardingPages[currentPage.value].backgroundImagePath;
    headline.value = onboardingPages[currentPage.value].headline;
    body.value = onboardingPages[currentPage.value].body;
  }

  @override
  void onInit() {
    currentPage.value = page1;
    initAndStartScaleAnimation();
    initNextAnimation();
    initColor();
    initOnboardingPage();
    initPageController(length: onboardingPages.length);
    super.onInit();
  }

  @override
  void onClose() {
    disposeScaleController();
    disposeNextController();
    disposeTabController();
  }
}
