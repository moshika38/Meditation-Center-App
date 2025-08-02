import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future <String> signInWithEmail(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user != null) {
        return 'Successfully signed in.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return 'Unknown error occurred.';
    }
    return 'Unknown error occurred.';
  }
}
