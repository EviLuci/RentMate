import 'package:go_router/go_router.dart';
import 'package:rentmate/features/auth/screens/login_screen.dart';
import 'package:rentmate/features/auth/screens/register_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);
