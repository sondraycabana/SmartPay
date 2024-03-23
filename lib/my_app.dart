import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/config/routes/app_pages.dart';
import 'app/config/themes/custom_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: BotToastInit(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      title: "SmartPay.",
      initialRoute: AppPages.initial,
      theme: CustomTheme.lightTheme, // remove literal color declarations
    );
  }
}
