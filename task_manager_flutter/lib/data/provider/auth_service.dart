import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  Future<User?> getUser() async {
    var currentUser = firebaseAuth.currentUser;
    return currentUser;
  }

  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
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

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   return 'No user found for that email.';
      // } else if (e.code == 'wrong-password') {
      //   return 'Wrong password provided for that user.';
      // } else {
      //   return e.code;
      // }
      return 'Username or password is incorrect';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}