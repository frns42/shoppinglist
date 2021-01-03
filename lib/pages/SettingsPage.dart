import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: [
          personalDataTextBox,
          SettingsButtons(),
        ],
      ),
    );
  }
}

Widget personalDataTextBox = Container(
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
                borderSide: BorderSide(color: Colors.deepOrange),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            prefixIcon: Icon(Icons.person),
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
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            prefixIcon: Icon(Icons.add),
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
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            prefixIcon: Icon(Icons.mail),
            filled: true,
            fillColor: Colors.white),
      ),
    ],
  ),
);

class SettingsButtons extends StatelessWidget {
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
              //save information
            },
            child: Text('Save'),
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
              //Cancel changes
            },
            child: Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
