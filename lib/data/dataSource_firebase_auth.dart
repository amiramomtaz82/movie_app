import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn google = GoogleSignIn();

  Future<UserCredential> login(String email, String password) {
    return auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final user = await google.signIn();
    final auth = await user!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    return this.auth.signInWithCredential(credential);
  }

  Future<void> resetPassword(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('================Password reset email sent!');
    } catch (e) {
      print('----------------------Error sending password reset email: $e');
    }
  }

  Future<User?> getCurrentUser() async => auth.currentUser;

  Future<void> logout() async {
    await google.signOut();
    await auth.signOut();
  }
}