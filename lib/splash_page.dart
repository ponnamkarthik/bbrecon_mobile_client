import 'package:bbrecon/api_key_page.dart';
import 'package:bbrecon/home_page.dart';
import 'package:bbrecon/misc/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _goNext() async {
    final prefs = await SharedPreferences.getInstance();
    final api = prefs.getString("api") ?? "";
    Future.delayed(const Duration(seconds: 1), () {
      if (api.isEmpty) {
        NavigationService().navigatePage(ApiKeyPage(), replaceAll: true);
      } else {
        NavigationService().navigatePage(HomePage(), replaceAll: true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _goNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo_big.png",
        ),
      ),
    );
  }
}
