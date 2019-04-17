import 'package:flutter/material.dart';
import './mail_login.dart' as mail;
void main() => runApp(
      MaterialApp(
        title: 'Flutter Catalog',
        // No need to set `home` because `routes` is set to a routing table, and
        // Navigator.defaultRouteName ('/') has an entry in it.
        home: new mail.LoginPage(),
      ),
    );