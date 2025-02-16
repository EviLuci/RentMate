import 'package:go_router/go_router.dart';
import 'package:rentmate/features/auth/screens/register_screen.dart';
import 'package:rentmate/features/auth/screens/login_screen.dart';
import 'package:rentmate/features/home/screens/home_screen.dart';
import 'package:rentmate/features/auth/services/auth_service.dart';
import 'package:rentmate/dependency_injection/service_locator.dart';

final appRouter = GoRouter(
  redirect: (context, state) {
    final authService = getIt<AuthService>();
    final isLoggedIn = authService.currentUser != null;

    // Refirect to home if logged in, otherwie redirect to login
    if (isLoggedIn && state.path == '/login') {
      return '/home';
    }
    if (!isLoggedIn && state.path != '/login') {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
