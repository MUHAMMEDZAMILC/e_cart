import 'package:e_cart/utils/theme_data.dart';
import 'package:e_cart/view/pages/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Cart',
      theme: MyTheme.theme,
      home: const SplashScreen(),
    );
  }
}

