import 'package:auto_route/auto_route.dart';
import 'package:filmy/views/app/app_extensions.dart';
import 'package:filmy/views/app/routes/router.dart';
import 'package:filmy/views/helper.dart';
import 'package:filmy/views/hive/hive_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Movies>(MoviesAdapter());
  await Hive.openBox<Movies>(Names.hiveBox);
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff1d1d27),
          colorScheme: ColorScheme.dark(
            secondary: Color(0xfffcb402),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(
          QAppX.router,
        ),
        routeInformationParser: QAppX.router.defaultRouteParser(),
        scrollBehavior: CupertinoScrollBehavior(),
      ),
    );
  }
}
