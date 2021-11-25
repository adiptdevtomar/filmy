// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../home_view/view.dart' as _i1;
import '../../login/view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRouteView.name: (routeData) {
      return _i3.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePageView());
    },
    LoginRouteView.name: (routeData) {
      return _i3.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPageView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/loginPage', fullMatch: true),
        _i3.RouteConfig(HomeRouteView.name, path: '/homePage'),
        _i3.RouteConfig(LoginRouteView.name, path: '/loginPage')
      ];
}

/// generated route for [_i1.HomePageView]
class HomeRouteView extends _i3.PageRouteInfo<void> {
  const HomeRouteView() : super(name, path: '/homePage');

  static const String name = 'HomeRouteView';
}

/// generated route for [_i2.LoginPageView]
class LoginRouteView extends _i3.PageRouteInfo<void> {
  const LoginRouteView() : super(name, path: '/loginPage');

  static const String name = 'LoginRouteView';
}
