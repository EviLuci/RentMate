import 'package:go_router/go_router.dart';
import 'package:rentmate/features/auth/screens/login_screen.dart';
import 'package:rentmate/features/auth/screens/register_screen.dart';
import 'package:rentmate/features/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    ],
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final isLoggingIn = state.uri.toString() == '/';
      final isRegistering = state.uri.toString() == '/register';

      if (!isLoggedIn && !isLoggingIn && !isRegistering) {
        return '/'; // Redirect to login screen if not logged in
      } else if (isLoggedIn && (isLoggingIn || isRegistering)) {
        return '/home'; // Redirect to home screen if logged in
      } else {
        return null;
      }
    });
