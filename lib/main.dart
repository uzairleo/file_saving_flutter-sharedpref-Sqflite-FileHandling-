import 'package:flutter/material.dart';
import 'package:saving_file_locally/FileHandling.dart';
import 'package:saving_file_locally/sharedPreferences.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApps(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

