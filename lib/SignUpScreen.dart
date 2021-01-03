import 'package:flutter/material.dart';

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
            signUpTextBox,
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
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Create account'),
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

Widget signUpTextBox = Container(
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
      ),
    ],
  ),
);