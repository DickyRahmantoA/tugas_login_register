import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

final _fireAuth = auth.FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var islogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

  void submit() async {
    final _isvalid = form.currentState!.validate();

    if (!_isvalid) {
      return;
    }

    form.currentState!.save();

    try {
      if (islogin) {
        final UserCredential = await _fireAuth.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      } else {
        final UserCredential = await _fireAuth.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      }
    } catch (e) {
      if (e is auth.FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print("email already in use");
        }
      }
    }

    notifyListeners();
  }
}
