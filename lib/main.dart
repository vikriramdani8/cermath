import 'package:cermath/route/routes.dart';
import 'package:cermath/shared/pallete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouterGenerator.generateRoute,
        navigatorObservers: <NavigatorObserver>[routeObserver]
    );
  }
}
