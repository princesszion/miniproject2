import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result;
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
