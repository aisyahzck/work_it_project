import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth;
  AuthService(this._auth);
  Stream<User> get authStateChanges => _auth.authStateChanges();


  Future<String> signOut () async {
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