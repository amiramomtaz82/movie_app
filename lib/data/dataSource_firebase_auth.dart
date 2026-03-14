import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/domain/models/user_dataModel.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Sign in with Google safely
  Future<UserDM?> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null; // user canceled

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) return null;

      // Firestore user document
      final doc = firestore.collection('users').doc(user.uid);
      final snapshot = await doc.get();

      if (!snapshot.exists) {
        // Create new user safely
        final newUser = UserDM(
          id: user.uid,
          email: user.email ?? '',             // fallback to empty string
          name: user.displayName ?? '',        // fallback to empty string
          phone: user.phoneNumber ?? '',       // fallback to empty string
          image: user.photoURL ?? '',          // fallback to empty string
          favoriteMovies: [],
          historyMovies: [],
        );

        await doc.set(newUser.toJson());
        return newUser;
      } else {
        final data = snapshot.data();
        if (data == null) return null;

        // Safely convert Firestore data to UserDM
        return UserDM.fromJson(Map<String, dynamic>.from(data));
      }
    } catch (e, st) {
      print("Google Sign-In error: $e");
      print(st);
      return null;
    }
  }

  /// Sign out from both Firebase and Google
  // Simple logout function
  Future<void> signOut() async {
    await auth.signOut();
  }

  // Delete user account
  Future<void> deleteAccount() async {
    final user = auth.currentUser;
    if (user != null) {
      await user.delete();
    } else {
      throw Exception('No user is currently logged in.');
    }
  }

  /// Email & password login
  Future<UserCredential> login(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Email & password register
  Future<UserCredential> register(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// Another Google Sign-In method returning UserCredential
  Future<UserCredential> signInWithGoogleAuth() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw Exception("Google sign in cancelled");

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  /// Send password reset email
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      print('================Password reset email sent!');
    } catch (e) {
      print('----------------------Error sending password reset email: $e');
    }
  }

  /// Get current user
  Future<User?> getCurrentUser() async => auth.currentUser;
   Future<void> logout() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }

}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:movie_app/data/user_dataModel.dart';
//
//
// class FirebaseAuthDataSource {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   Future<UserDM?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return null; // user canceled
//
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final userCredential = await auth.signInWithCredential(credential);
//       final user = userCredential.user;
//       if (user == null) return null;
//
//       // Check if user already exists in Firestore
//       final doc = firestore.collection('users').doc(user.uid);
//       final snapshot = await doc.get();
//
//       if (!snapshot.exists) {
//         // create new user
//         final newUser = UserDM(
//           id: user.uid,
//           email: user.email ?? '',
//           name: user.displayName ?? '',
//           phone: user.phoneNumber ?? '',
//           image: user.photoURL??"",
//           favoriteMovies: [],
//           historyMovies: [],
//         );
//         await doc.set(newUser.toJson());
//         return newUser;
//       } else {
//         // return existing user
//         return UserDM.fromJson(snapshot.data() as Map<String, dynamic>);
//       }
//     } catch (e) {
//       print("Google Sign-In error: $e");
//       return null;
//     }
//   }
//
//   Future<void> signOut() async {
//     await auth.signOut();
//     await googleSignIn.signOut();
//   }
//
//
//   Future<UserCredential> login(String email, String password) {
//     return auth.signInWithEmailAndPassword(
//         email: email, password: password);
//   }
//
//   Future<UserCredential> register(String email, String password) {
//     return auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//   }
//
//   Future<UserCredential> signInWithGoogleAuth() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final googleUser = await googleSignIn.signIn();
//     if (googleUser == null) throw Exception("Google sign in cancelled");
//
//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//   Future<void> resetPassword(String email) async{
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       print('================Password reset email sent!');
//     } catch (e) {
//       print('----------------------Error sending password reset email: $e');
//     }
//   }
//
//   Future<User?> getCurrentUser() async => auth.currentUser;
//
//   Future<void> logout() async {
//     await googleSignIn.signOut();
//     await auth.signOut();
//   }
// }