import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/main.dart';

class InitialScreen extends StatelessWidget {
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

class EmailAndPasswordFields extends StatelessWidget {
  ApplicationState appState;

  EmailAndPasswordFields(this.appState);

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
                hintText: 'Enter e-mail here',
                filled: true,
                fillColor: Colors.white),
            onChanged: (emailTextProvidedByUser) {
              appState.setEmail(emailTextProvidedByUser);
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
            onChanged: (passwordProvidedByUser) {
              appState.setPassword(passwordProvidedByUser);
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

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            StyledButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              appState.signIn(() => Navigator.pushNamed(context, '/sign-up'),
                  (e) => _showErrorDialog(context, 'Could not login', e));
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

class StyledButton extends StatelessWidget {
  const StyledButton({@required this.child, @required this.onPressed});

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
      );
}
