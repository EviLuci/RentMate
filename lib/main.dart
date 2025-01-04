import 'package:flutter/material.dart';
import 'package:rentmate/routes/app_routes.dart';
import 'package:rentmate/theme/app_theme.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RentMateApp());
}

class RentMateApp extends StatefulWidget {
  const RentMateApp({super.key});

  @override
  State<RentMateApp> createState() => _RentMateAppState();
}

class _RentMateAppState extends State<RentMateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentMate',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      home: Scaffold(
        appBar: AppBar(title: Text('RentMate')),
        body: Center(child: Text('Welcome to RentMate')),
      ),
    );
  }
}
