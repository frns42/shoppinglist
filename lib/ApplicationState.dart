import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  void init() async {
    await Firebase.initializeApp();
  }

  void tryLogin(String name, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: name,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }
}