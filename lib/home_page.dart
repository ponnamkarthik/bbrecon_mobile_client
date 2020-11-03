import 'package:bbrecon/misc/navigation_service.dart';
import 'package:bbrecon/pages/domains/domains_home.dart';
import 'package:bbrecon/pages/notifications/notifications_home.dart';
import 'package:bbrecon/pages/programs/programs_home.dart';
import 'package:bbrecon/pages/programs/widgets/programs_filters_widget.dart';
import 'package:bbrecon/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tabProvider = StateProvider((ref) => 0);

class HomePage extends HookWidget {
  final PageController _pageController = PageController();
  Future<void> _logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    NavigationService().navigatePage(SplashPage(), replaceAll: true);
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = useProvider(tabProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bug Bounty Recon"),
        actions: [
          IconButton(
            tooltip: "Logout",
            icon: const Icon(AntDesign.logout),
            onPressed: () {
              _logout();
            },
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          ProgramsHomePage(),
          DomainsHomePage(),
          NotificationsHomePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (value) {
          context.read(tabProvider).state = value;
          _pageController.jumpToPage(
            value,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_small_rounded),
            label: "Programs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_outlined),
            label: "Domains",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          )
        ],
      ),
    );
  }
}
