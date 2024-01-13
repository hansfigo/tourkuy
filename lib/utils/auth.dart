import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);
}

class Auth {
  static Future<void> signIn(String emailAddress, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } catch (e) {
      throw AuthenticationException('No user found for that email.');

      // if (e.code == 'user-not-found') {
      //   throw AuthenticationException('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   throw AuthenticationException('Wrong password provided.');
      // }
    }
  }

  static Future<void> signUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = credential.user;

      await user?.updateDisplayName("Jane Q. User");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
