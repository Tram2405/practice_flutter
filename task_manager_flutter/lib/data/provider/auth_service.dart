import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<User?> getUser() async {
    var currentUser = firebaseAuth.currentUser;
    return currentUser;
  }

  Future<String?> registration({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      addUserDetails(fullName, email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future addUserDetails(String fullName, String emailAddress) async {
    await fireStore.collection('users').add({
      'full name': fullName,
      'email address': emailAddress,
    });
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (_) {
      return 'Username or password is incorrect';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> passwordReset(BuildContext context,
      {required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset link sent! Check your email';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
