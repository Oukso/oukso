import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;
  // Konstruktor
  AuthRepository(this._firebaseAuth);
  // Methoden
  /// returns the currently logged in [User]
  /// or `null` if no User is logged in
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// Sign up with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// Login with email and password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  /// Logout
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  /// Stream of authentication state changes
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
