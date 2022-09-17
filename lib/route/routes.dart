import 'package:cermath/login/firstlaunch.dart';
import 'package:cermath/login/login.dart';
import 'package:cermath/menu/modul/listmodul.dart';
import 'package:cermath/menu/quiz/quiz.dart';
import 'package:flutter/material.dart';

import '../login/information.dart';
import '../login/register.dart';
import '../menu/menu.dart';
import '../menu/modul/preview-pdf.dart';
import '../menu/quiz/listquiz.dart';
import '../testing.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstLaunch());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/information':
        return MaterialPageRoute(builder: (_) => Information());
      case '/menu':
        return MaterialPageRoute(builder: (_) => Menu());
      case '/listModul':
        return MaterialPageRoute(
            builder: (_) => ListModul(), settings: settings);
      case '/listQuiz':
        return MaterialPageRoute(
            builder: (_) => ListQuiz(), settings: settings);
      case '/previewPdf':
        return MaterialPageRoute(
            builder: (_) => PreviewPdf(), settings: settings);
      case '/quiz':
        return MaterialPageRoute(builder: (_) => Quiz(), settings: settings);
      // case '/testing':
      //   return MaterialPageRoute(builder: (_) => Testing());
      default:
        return _errorRoute();
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found!"),
        ),
        body: const Center(
          child: Text("Error 404!"),
        ),
      );
    });
  }
}
