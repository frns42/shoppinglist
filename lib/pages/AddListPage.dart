import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/main.dart';

class AddListPage extends StatefulWidget {

  ApplicationState appState;
  AddListPage(this.appState);

  @override
  _AddListPageState createState() => _AddListPageState(appState);
}

class _AddListPageState extends State<AddListPage> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  ApplicationState appState;
  _AddListPageState(ApplicationState appState) {
    this.appState = appState;
  }

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
        actions: [
          FlatButton(
            onPressed: () {
              ref.add({
                'userId': appState.getUserId(),
                'title': title.text,
                'content': content.text
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              //decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    hintText: 'Title',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                //decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      hintText: 'Products',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}