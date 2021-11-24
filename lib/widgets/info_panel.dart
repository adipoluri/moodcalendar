import 'package:flutter/material.dart';
import 'package:moodcalendar/util/constants.dart';

class InfoPanel extends StatefulWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  _InfoPanelState createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '--> WELCOME TO MOODLY -->',
            style: TextStyle(
              color: light2,
              fontSize: 45,
              fontFamily: 'NerdBoldItalic',
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }

}
