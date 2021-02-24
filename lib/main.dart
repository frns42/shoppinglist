import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/HomeScreen.dart';
import 'package:shopping_list/InitialScreen.dart';
import 'package:shopping_list/SignUpScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    lazy: false,
    child: ShoppingList(),
  ));
}

class ApplicationState with ChangeNotifier {

  String email;
  String password;

  ApplicationState() {
    print('In ApplicationState Constructor!');
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();
    print('after firebase initialize');

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        print('We are logged in and have a user have a user: ' + user.email);
      }
    });
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signIn(void Function() onSuccess, void Function(FirebaseAuthException e) errorCallback,) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: this.email,
        password: this.password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void setEmail(String email) {
    this.email = email;
  }
  void setPassword(String password) {
    this.password = password;
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("In ShoppingList build method");
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/home': (context) => HomeScreen(),
        '/sign-up': (context) => SignUpScreen(),
      },
    );
  }
}
