import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo<T extends Object>(Route<T> route, {bool replaceAll = false}) {
    if (replaceAll) {
      return navigatorKey.currentState.pushAndRemoveUntil(route, (route) => false);
    } else {
      return navigatorKey.currentState.push(route);
    }
  }

  dynamic navigatePage(Widget page, {PageTransitionType type, bool replaceAll = false, String name}) {
    return navigateTo<PageTransition>(
      PageTransition(
        settings: RouteSettings(name: name),
        child: page,
        type: PageTransitionType.fade,
        curve: Curves.easeInOut,
      ),
      replaceAll: replaceAll,
    );
  }
}
