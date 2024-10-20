import 'package:flutter/material.dart';

class FakeNavigatorObserver extends NavigatorObserver {
   Route<dynamic>? route;
   Route<dynamic>? previousRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    this.route = route;
    this.previousRoute = previousRoute;
    super.didPush(route, previousRoute);
  }
}
