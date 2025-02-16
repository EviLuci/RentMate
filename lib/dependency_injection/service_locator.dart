import 'package:get_it/get_it.dart';
import 'package:rentmate/features/auth/services/auth_service.dart';
import 'package:rentmate/data/repositories/rental_repository_impl.dart';
import 'package:rentmate/features/home/cubit/home_cubit.dart';
import 'package:rentmate/features/chat/cubit/chat_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeAppDependencies() async {
  // Register services, repositories and other dependencies

  getIt.registerLazySingleton<AuthService>(() => AuthService());

  getIt.registerLazySingleton<RentalRepositoryImpl>(
      () => RentalRepositoryImpl());

  // Register cubits
  getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getIt<RentalRepositoryImpl>()));

  getIt.registerFactory<ChatCubit>(() => ChatCubit());
}
