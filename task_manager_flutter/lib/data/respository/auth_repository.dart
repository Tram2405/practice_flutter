import 'package:cloud_firestore/cloud_firestore.dart';
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

  String getEmailCurrentUser() {
    return authService.userCurrent!.email ?? '';
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserByEmail(String email) {
    return authService.fireStore
        .collection('users')
        .where('email address', isEqualTo: email)
        .snapshots();
  }

  Future<String> updateProfile(String id, String name) async {
    return await authService.updateProfile(
      id: id,
      name: name,
    );
  }

  Future<String> changePassword(
      String currentPassword, String newPassword) async {
    return await authService.changePassword(currentPassword, newPassword);
  }
}
