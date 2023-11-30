import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_service.dart';

class AuthController {
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<User?> signIn(String email, String password) {
    return _authService.signIn(email, password);
  }

  Future<void> signOut() {
    return _authService.signOut();
  }
}
