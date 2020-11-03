import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/misc/navigation_service.dart';
import 'package:bbrecon/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BBRecon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      navigatorKey: NavigationService.navigatorKey,
      home: SplashPage(),
    );
  }
}
// #ef3e54
