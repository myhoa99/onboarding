import 'package:fast_food/presentation/routes/app_pages.dart';
import 'package:fast_food/presentation/screens/onboarding_screen.dart';
import 'package:fast_food/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      default:
        return null;
    }
  }
}
