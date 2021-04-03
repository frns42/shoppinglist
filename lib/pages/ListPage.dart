import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_list/main.dart';
import 'EditList.dart'; // new

class ListPage extends StatefulWidget {
  ApplicationState appState;
  ListPage(this.appState);

  @override
  _ListPageState createState() => _ListPageState(this.appState);
}

class _ListPageState extends State<ListPage> {
  final ref = FirebaseFirestore.instance.collection('notes');

  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  ApplicationState appState;
  _ListPageState(this.appState);

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
        body: StreamBuilder(
            stream: ref.where('userId', isEqualTo: appState.getUserId()).snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditList(
                                    docToEdit: snapshot.data.docs[index])));
                      },
                      child: Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(snapshot.data.docs[index].data()['title']),
                            Text(snapshot.data.docs[index].data()['content']),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}