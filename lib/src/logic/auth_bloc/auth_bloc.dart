import 'package:badminton_1/src/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthStarted>((_, emit) async {
      final user = await _authRepo.user.first;
      emit(user != null ? AuthAuthenticated(user) : AuthUnauthenticated());
    });

    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await _authRepo.logIn(email: event.email, password: event.password);
        emit(user != null
            ? AuthAuthenticated(user)
            : AuthFailure('Login failed'));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthRegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepo.register(
            email: event.email, password: event.password);
        emit(user != null
            ? AuthAuthenticated(user)
            : AuthFailure('Registration failed'));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLoggedOut>((_, emit) async {
      await _authRepo.logOut();
      emit(AuthUnauthenticated());
    });
  }
}
