import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/product.dart';


class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  final _formKey = GlobalKey<FormState>();
  Product _product = Product();
  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }

  _form() =>
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Add new product'),
                validator: (val) =>
                (val.length == 0 ? 'This field is mandatory' : null),
                onSaved: (val) => setState(() => _product.name = val),
              ),
              Container(
                width: 150,
                height: 40,
                margin: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () => _onAdd(),
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
      );

  _onAdd() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Added product ${_product.name}');
      _products.add(Product(id: null, name: _product.name));
      form.reset();
    }
  }

  _list() =>
      Expanded(child: Card(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Scrollbar(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              if(_products.length<index)
                return null;
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text(
                      _products[index].name.toUpperCase(),
                      style: TextStyle(
                          color: Colors.deepOrange, fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text('test'),
                    onTap: (){},
                  ),
                  Divider(
                    height: 5.0,
                  )
                ],
              );
            },
          ),
        ),
      ));
}
