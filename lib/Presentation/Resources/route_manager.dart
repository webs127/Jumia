import 'package:flutter/material.dart';
import 'package:jumia/Presentation/Screens/Main/OnBoarding/Camera/camera_view.dart';
import 'package:jumia/Presentation/Screens/Main/main_view.dart';
import 'package:jumia/Wrapper/wrapper.dart';
import '../Screens/Splash/splash.dart';

class RouteManager {
  static const String splash = "/";
  static const String wrapper = "/wrapper";
  static const String main = "/main";
  static const String edit = "/edit";
  static const String camera = "/camera";
}

class Routes {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.wrapper:
        return MaterialPageRoute(builder: (_) => const Wrapper());
      case RouteManager.main:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteManager.camera:
        return MaterialPageRoute(builder: (_) => const CameraView());
      default:
        return unDefined();
    }
  }
}

Route<dynamic> unDefined() => MaterialPageRoute(
    builder: (_) => const Scaffold(
          body: Center(
            child: Text("No Data"),
          ),
        ));
