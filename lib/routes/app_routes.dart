import 'package:flutter/material.dart';
import 'package:rentmate/features/splash/splash_screen.dart';
import 'package:rentmate/features/auth/screens/login_screen.dart'; // Add Auth screen

class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case auth:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404: Page Not Found')),
          ),
        );
    }
  }
}
