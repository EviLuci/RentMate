import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentmate/theme/app_theme.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dependency_injection/service_locator.dart';
import 'package:rentmate/routes/app_routes.dart';

import 'package:rentmate/features/auth/cubit/auth_cubit.dart';
import 'package:rentmate/features/auth/services/auth_service.dart';
import 'package:rentmate/data/repositories/rental_repository_impl.dart';
import 'package:rentmate/features/home/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeAppDependencies(); // Initialize dependency injection
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(getIt<AuthService>()),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(getIt<RentalRepositoryImpl>()),
        ),
      ],
      child: const RentMateApp(),
    ),
  );
}

class RentMateApp extends StatelessWidget {
  const RentMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'RentMate',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
