import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:soft_news_ai/styles/theme.dart';
import 'package:soft_news_ai/views/screens/home/home_screen.dart';
import 'package:soft_news_ai/views/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme(),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
