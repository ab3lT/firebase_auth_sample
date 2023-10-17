import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up a new user
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      return user;
    } catch (e) {
      print("Error during user registration: $e");
      return null;
    }
  }

  // Sign in an existing user
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      return user;
    } catch (e) {
      print("Error during user login: $e");
      return null;
    }
  }

  // Sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
