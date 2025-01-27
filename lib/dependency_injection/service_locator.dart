import 'package:get_it/get_it.dart';
import 'package:rentmate/core/services/firebase_service.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Register services, repositories and other dependencies
  sl.registerLazySingleton(() => FirebaseService());
}
