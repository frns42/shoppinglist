import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/Helper.dart';
import 'main.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: ListView(
        padding: EdgeInsets.only(top: 70.0),
        children: [
          Center(
            child: Text(
              'Create an account!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.white),
            ),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => SignupFields(appState),
          ),
          Container(
              margin: EdgeInsets.only(left: 100, right: 100, bottom: 5),
              child: Consumer<ApplicationState>(
                builder: (context, appState, _) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 40),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    appState.registerAccount(() {
                      Navigator.pushNamed(context, '/home');
                    }, (e) {
                      Helper.showErrorDialog(
                          context, "Error creating new user", e);
                    });
                  },
                  child: Text('Create account'),
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 100, right: 100, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 40),
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
    );
  }
}

class SignupFields extends StatefulWidget {
  ApplicationState appState;

  SignupFields(this.appState);

  @override
  _SignupFieldsState createState() => _SignupFieldsState(appState);
}

class _SignupFieldsState extends State<SignupFields> {
  bool _isObscure = true;
  ApplicationState appState;

  _SignupFieldsState(ApplicationState appState) {
    this.appState = appState;
  }

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
                hintText: 'First name',
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
                hintText: 'Last name',
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
                hintText: 'E-mail',
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
                hintText: 'Password',
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
            obscureText: _isObscure,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                hintText: 'Confirm Password',
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
