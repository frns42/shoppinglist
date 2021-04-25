import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/main.dart';
import 'package:shopping_list/Helper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        padding: EdgeInsets.only(top: 170.0),
        child: Column(
          children: [
            welcomeText,
            Consumer<ApplicationState>(
              builder: (context, appState, _) =>
                  EmailAndPasswordFields(appState),
            ),
            Consumer<ApplicationState>(
              builder: (context, appState, _) => InitialButtons(appState),
            )
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

class EmailAndPasswordFields extends StatefulWidget {
  ApplicationState appState;

  EmailAndPasswordFields(this.appState);

  @override
  _EmailAndPasswordFieldsState createState() => _EmailAndPasswordFieldsState();
}

class _EmailAndPasswordFieldsState extends State<EmailAndPasswordFields> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Widget emailAndPasswordFields = Container(
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
                prefixIcon: Icon(Icons.mail),
                hintText: 'E-mail',
                filled: true,
                fillColor: Colors.white),
            onChanged: (emailTextProvidedByUser) {
              widget.appState.setEmail(emailTextProvidedByUser);
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
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white),
            onChanged: (passwordProvidedByUser) {
              widget.appState.setPassword(passwordProvidedByUser);
            },
          ),
        ],
      ),
    );
    return emailAndPasswordFields;
  }
}

class InitialButtons extends StatelessWidget {
  ApplicationState appState;

  InitialButtons(this.appState);

  @override
  Widget build(BuildContext context) {

    appState.registerIfLoggedInAction(() => Navigator.pushNamed(context, '/home'));
    appState.registerIfLoggedOutAction(() => Navigator.pushNamed(context, '/'));
    return Column(
      children: [
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
              appState.signIn(() => Navigator.pushNamed(context, '/home'),
                  (e) => Helper.showErrorDialog(context, 'Could not login', e));
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
