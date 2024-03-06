import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';

class AuthRepository{
  final AuthService authService;
  AuthRepository({required this.authService});

  Future<String?> login(String email, String password) {
    return authService.login(email: email, password: password);
  }

  Future<User?> getUser() {
    return authService.getUser();
  }

  Future<void> signOut() {
    return authService.signOut();
  }
}