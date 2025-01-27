import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentmate/core/services/firebase_service.dart';
import 'package:rentmate/dependency_injection/service_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseService _firebaseService = sl<FirebaseService>();

  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final user =
        await _firebaseService.signInWithEmailAndPassword(email, password);
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure('Login Failed. Please check your credentials.'));
    }
  }

  Future<void> register(
      String email, String password, Map<String, dynamic> userData) async {
    emit(AuthLoading());
    final user = await _firebaseService.registerWithEmailAndPassword(
        email, password, userData);
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure('Registration Failed. Please try again.'));
    }
  }
}
