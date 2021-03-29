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
  String displayName;

  String firstName;
  String lastName;

  String pwd1ForSignup;

  String pwd2ForSignup;

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

  void registerAccount(void Function() onSuccess, void Function(Exception e) errorCallback,) async {

    if (pwd1ForSignup != pwd2ForSignup){
      print(pwd1ForSignup);
      print(pwd2ForSignup);
      errorCallback(new Exception("Passwords not matching"));
      return;
    }

    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd1ForSignup);
      displayName = firstName + ' ' + lastName;
      password = pwd1ForSignup;
      await credential.user.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signIn(void Function() onSuccess, void Function(Exception e) errorCallback,) async {
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

  void setPwdForSignup1(String pwd1) {
    this.pwd1ForSignup = pwd1;
  }

  void setPwdForSignup2(String pwd2) {
    this.pwd2ForSignup = pwd2;
  }

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }
  
  void setLastName(String lastName) {
    this.lastName = lastName;
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("In ShoppingList build method");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/home': (context) => HomeScreen(),
        '/sign-up': (context) => SignUpScreen(),
      },
    );
  }
}
