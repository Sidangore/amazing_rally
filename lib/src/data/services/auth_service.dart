import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    final cred = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  Future<User?> signUp(String email, String password) async {
    final cred = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  Future<void> signOut() => _firebaseAuth.signOut();
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
