import 'package:flutter/material.dart';
import 'package:mobile_form/core/constants/const.dart';
import 'package:mobile_form/ui/screens/add_task_screen.dart';
import 'package:mobile_form/ui/screens/home_screen.dart';
import 'package:mobile_form/ui/screens/login_screen.dart';
import 'package:mobile_form/ui/screens/register_screen.dart';
import 'package:page_transition/page_transition.dart';

class RoutePath {
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String addTask = 'addTask';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.login:
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.fade,
            duration: Const().duration);
      case RoutePath.register:
        return PageTransition(
            child: const RegisterScreen(),
            type: PageTransitionType.fade,
            duration: Const().duration);
      case RoutePath.home:
        return PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
            duration: Const().duration);
      case RoutePath.addTask:
        return PageTransition(
            child: const AddTaskScreen(),
            type: PageTransitionType.fade,
            duration: Const().duration);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route To ${settings.name}"),
                  ),
                ));
    }
  }
}
