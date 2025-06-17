import 'package:badminton_1/src/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<User?> logIn({required String email, required String password}) {
    return _authService.signInWithEmail(email, password);
  }

  Future<User?> register({required String email, required String password}) {
    return _authService.signUp(email, password);
  }

  Future<void> logOut() => _authService.signOut();
  Stream<User?> get user => _authService.authStateChanges;
}
