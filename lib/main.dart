import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodcalendar/auth/auth.dart';
import 'package:moodcalendar/home.dart';
import 'package:moodcalendar/util/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future init() async { 
    await Firebase.initializeApp();
    await getUser();
    setState(() {});
    print(AuthService.uid);
  }

  @override
  void initState() {
    init();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) => context.read<AuthService>().authStateChanges,
      initialData: null,
      child: MaterialApp( 
        title: 'Mood Calendar',
        theme: ThemeData(
          backgroundColor: dark0,
        ),
        home: const Home(),
      ),
    );
  }
}


