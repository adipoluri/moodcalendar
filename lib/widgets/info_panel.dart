import 'package:flutter/material.dart';
import 'package:moodcalendar/auth/auth.dart';
import 'package:moodcalendar/auth/auth_dialog.dart';
import 'package:moodcalendar/util/constants.dart';
import 'package:moodcalendar/util/database.dart';

class InfoPanel extends StatefulWidget {
  final Function reloadPage;

  const InfoPanel(this.reloadPage, {Key? key}) : super(key: key);
  
  @override
  _InfoPanelState createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '--> WELCOME TO MOODLY -->',
            style: TextStyle(
              color: light2,
              fontSize: 45,
              fontFamily: 'NerdBoldItalic',
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          AuthService.userEmail == null ? signInButton() : signOutButton(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AuthDialog(widget.reloadPage),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'NerdBoldItalic',
            color: light2,
          ),
        ),
      ),
    );
  }

  Widget signOutButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: _isProcessing
          ? null
          : () async {
              setState(() {
                _isProcessing = true;
              });
              await signOut().then((result) {
                print(result);
              }).catchError((error) {
                print('Sign Out Error: $error');
              });
              setState(() {
                _isProcessing = false;
              });
            },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        child: _isProcessing
            ? const CircularProgressIndicator()
            : const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NerdBoldItalic',
                  color: light2,
                ),
              ),
      ),
    );
  }
}
