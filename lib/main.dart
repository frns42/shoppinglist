import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(ShoppingList());

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/home': (context) => HomeScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/list': (context) => ListPage()
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
        padding: EdgeInsets.only(top: 170.0),
        child: Column(
          children: [
            Text(
              'Welcome to Shopping List!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.white),
            ),
            textBox,
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
        ),
      ),
    );
  }
}

Widget textBox = Container(
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

/*
Widget signUpButton = Container(
  width: 250,
  height: 40,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0))),
    onPressed: () {
      Navigator.pushNamed(context, '/sign-up');
    },
    child: Text('Sign up'),
  ),
);
*/
/*
Widget loginButton = Container(
  width: 250,
  height: 40,
  margin: EdgeInsets.all(10.0),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0))),
    onPressed: () {
      //Navigator.pushNamed(context, '/home');
    },
    child: Text('Login'),
  ),
);
 */

/*
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
 */

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Shopping List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: (Text(
          'This is where the lists will be located',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white,
        backgroundColor: Colors.deepOrange,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          Navigator.pushNamed(context, '/list');
        },
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Shopping List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[Text('Shopping list')],
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white,
        backgroundColor: Colors.transparent,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          Navigator.pushNamed(context, '/list');
        },
      ),
    );
  }
}

/*
        body: ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 55,
                      height: 55,
                      color: Colors.deepOrange,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.deepOrange,
                        backgroundImage: NetworkImage(
                            "https://media.moddb.com/images/mods/1/35/34898/gabe-newell.jpg"),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text('Namn')],
                    ),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
      )
 */

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