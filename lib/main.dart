import 'package:flutter/material.dart';
import './firebase_login_ex.dart' as firebase_login;

void main() => runApp(
      MaterialApp(
        title: 'Flutter Catalog',
        theme: ThemeData(primarySwatch: Colors.blue),
        // No need to set `home` because `routes` is set to a routing table, and
        // Navigator.defaultRouteName ('/') has an entry in it.
        home: new firebase_login.LoginPage(),
      ),
    );