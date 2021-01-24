import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth;
  AuthService(this._auth);
  Stream<User> get authStateChanges => _auth.authStateChanges();
  final googleSignIn = GoogleSignIn();

  Future<String> signOut () async {

    User user = await _auth.currentUser;

    if (user.providerData[1].providerId == 'google.com') {
      await googleSignIn.signOut();
    }

    await _auth.signOut();
    return 'Signed out';
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Signed up';
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }
}