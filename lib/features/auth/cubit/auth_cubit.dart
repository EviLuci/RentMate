import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentmate/features/auth/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  // Login
  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.signInWithEmailAndPassword(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void register(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authService.registerWithEmailAndPassword(email, password);
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void signOut() async {
    try {
      await _authService.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
