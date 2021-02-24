import 'package:flutter/material.dart';

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
            emailTextBox,
            InitialButtons(),
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

Widget emailTextBox = Container(
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
    ],
  ),
);

class InitialButtons extends StatelessWidget {
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
              Navigator.pushNamed(context, '/home');
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
