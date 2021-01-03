import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/SignUpScreen.dart';
import 'package:shopping_list/HomeScreen.dart';
import 'package:shopping_list/InitialScreen.dart';
import 'package:shopping_list/SettingsScreen.dart';

void main() => runApp(ShoppingList());

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/settings',
      routes: {
        '/': (context) => InitialScreen(),
        '/home': (context) => HomeScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/settings': (context) => SettingsScreen()
      },
    );
  }
}