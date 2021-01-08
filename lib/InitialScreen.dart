import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ApplicationState.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final userNameController = new TextEditingController();
  final userPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        padding: EdgeInsets.only(top: 170.0),
        child: Column(
          children: [
            welcomeText,
            TextBox(userNameController, userPasswordController),
            Consumer<ApplicationState>(
                builder: (context, appstate, _) => InitialButtons(
                    userNameController,
                    userPasswordController,
                    appstate.tryLogin)),
          ],
        ),
      ),
    );
  }
}

Widget welcomeText = Container(
  child: Text('Welcome to Shopping List!',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27.0, color: Colors.white)),
);

class TextBox extends StatelessWidget {
  TextEditingController name;
  TextEditingController password;

  TextBox(TextEditingController name, TextEditingController password) {
    this.name = name;
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.mail),
                hintText: 'Enter e-mail here',
                filled: true,
                fillColor: Colors.white),
          ),
          Container(
            child: Text(
              '',
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter password here',
                filled: true,
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}

class InitialButtons extends StatefulWidget {
  TextEditingController name;
  TextEditingController password;

  void Function(String name, String password,
      void Function(FirebaseAuthException e) error) tryLogin;

  InitialButtons(
      TextEditingController userNameController,
      TextEditingController userPasswordController,
      void Function(String name, String password,
              void Function(FirebaseAuthException e) error)
          tryLogin) {
    this.name = userNameController;
    this.password = userPasswordController;
    this.tryLogin = tryLogin;
  }

  @override
  _InitialButtonsState createState() =>
      _InitialButtonsState(name, password, tryLogin);
}

class _InitialButtonsState extends State<InitialButtons> {
  var _userName;
  var _userPassword;

  String errorLoginText = '';

  TextEditingController name;
  TextEditingController password;

  void Function(String name, String password,
      void Function(FirebaseAuthException e) error) tryLogin;

  _InitialButtonsState(
      TextEditingController name,
      TextEditingController password,
      void Function(String name, String password,
              void Function(FirebaseAuthException e) error)
          tryLogin) {
    this.name = name;
    this.password = password;
    this.tryLogin = tryLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 10,
          child: Text(
            '$errorLoginText',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          width: 250,
          height: 40,
          margin: EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
            onPressed: () {
              setState(() {
                errorLoginText = '';
              });
              this.tryLogin(
                  name.text,
                  password.text,
                  (e) => {
                        setState(() {
                          errorLoginText = e.message;
                        })
                      });
              //Navigator.pushNamed(context, '/home');
            },
            child: Text('Login'),
          ),
        ),
        Container(
          width: 250,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text('Sign up'),
          ),
        ),
      ],
    );
  }
}
