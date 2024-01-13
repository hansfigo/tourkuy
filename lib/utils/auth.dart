import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourkuy/utils/firebase/firebase.dart';

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
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException((e.code).toString());
    }
  }

  static Future<void> signUp(
      String username, String emailAddress, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = credential.user;

      await user?.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException((e.code).toString());
    }
  }

  static Future<void> signOut() async {
    auth.signOut();
  }

  static bool isUserSignIn() {
    if (auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
