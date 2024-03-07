import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_flutter/data/provider/auth_service.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository({required this.authService});

  Future<String?> login(String email, String password) {
    return authService.login(email: email, password: password);
  }

  Future<String?> registration(
      {required String fullName,
      required String email,
      required String password}) {
    return authService.registration(
        fullName: fullName, email: email, password: password);
  }

  Future<User?> getUser() {
    return authService.getUser();
  }

  Future<void> signOut() {
    return authService.signOut();
  }

  Future<void> passwordReset(BuildContext context, {required String email}) {
    return authService.passwordReset(context, email: email);
  }
}
