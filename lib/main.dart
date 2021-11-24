import 'package:flutter/material.dart';
import 'package:moodcalendar/auth/auth.dart';
import 'package:moodcalendar/home.dart';
import 'package:moodcalendar/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Calendar',
      theme: ThemeData(
        backgroundColor: dark0,
      ),
      home: const Home(),
    );
  }
}

