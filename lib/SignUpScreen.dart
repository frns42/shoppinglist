import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/helper.dart';

import 'main.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Text(
              'Create an account!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.white),
            ),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => SignupFields(appState),
            ),
            Container(
                width: 250,
                height: 40,
                margin: EdgeInsets.all(10.0),
                child: Consumer<ApplicationState>(
                  builder: (context, appState, _) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                    onPressed: () {
                      appState.registerAccount(() {Navigator.pushNamed(context, '/home');}, (e) {helper.showErrorDialog(context, "Error creating new user", e);});
                    },
                    child: Text('Create account'),
                  ),
                )),
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
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupFields extends StatelessWidget {
  ApplicationState appState;

  SignupFields(this.appState);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter first name',
                filled: true,
                fillColor: Colors.white),
            onChanged: (firstName) {
              appState.setFirstName(firstName);
            },
          ),
          Container(
            child: Text(
              '',
            ),
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter last name',
                filled: true,
                fillColor: Colors.white),
            onChanged: (lastName) {
              appState.setLastName(lastName);
            },
          ),
          Container(
            child: Text(
              '',
            ),
          ),
          TextField(
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
            onChanged: (email) {
              appState.setEmail(email);
            },
          ),
          Container(
            child: Text(
              '',
            ),
          ),
          TextField(
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
            onChanged: (firstPwdForSignUp) {
              appState.setPwdForSignup1(firstPwdForSignUp);
            },
          ),
          Container(
            child: Text(
              '',
            ),
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Confirm password',
                filled: true,
                fillColor: Colors.white),
            onChanged: (secondPwdForSignUp) {
              appState.setPwdForSignup2(secondPwdForSignUp);
            },
          ),
        ],
      ),
    );
  }
}
