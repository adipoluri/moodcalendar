import 'package:flutter/material.dart';
import 'package:moodcalendar/auth/auth.dart';
import 'package:moodcalendar/util/constants.dart';
import 'package:moodcalendar/widgets/chart.dart';
import 'package:moodcalendar/widgets/info_panel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      body: mainScreen(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget mainScreen() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: InfoPanel(this.updateUserState),
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Chart(),
            ),
          ),
          Expanded(
            flex: 1,
            child: cred(),
          ),
        ],
      );
  }

  void updateUserState(){
    setState(() {
    });
  }


  Widget cred() {
    return const Center(
      child: Text(
        '2021 © Made with <3 by Adi, Alex, and Jayden',
        maxLines: 2,
        style: TextStyle(
          color: dark3,
          fontSize: 14,
          fontFamily: "Nerd",
          fontWeight: FontWeight.w300,
          // letterSpacing: 3,
        ),
      ),
    );
  }
}
