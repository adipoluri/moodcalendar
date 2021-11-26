import 'package:flutter/material.dart';
import 'package:moodcalendar/auth/google_sign.dart';
import 'package:moodcalendar/util/constants.dart';
import 'auth.dart';

class AuthDialog extends StatefulWidget {
  final Function reloadPage;
 
  const AuthDialog(this.reloadPage, {Key? key}) : super(key: key);
  
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'MOODLY',
                    style: TextStyle(
                      color: light2,
                      fontSize: 24,
                      fontFamily: 'NerdBoldItalic',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                emailText(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: emailField(),
                ),
                const SizedBox(height: 20),
                passwordText(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: passwordField(),
                ),
                authButtons(),
                loginStatus != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: Text(
                            loginStatus!,
                            style: TextStyle(
                              color: loginStringColor,
                              fontSize: 14,
                              // letterSpacing: 3,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.blueGrey[200],
                  ),
                ),
                const SizedBox(height: 30),
                Center(child: GoogleButton(widget.reloadPage)),
                const SizedBox(height: 30),
                declaration(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --------------- Text and TextFields --------------- //
  Padding emailText() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        bottom: 8,
      ),
      child: Text(
        'Email address',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: light2,
          fontSize: 18,
          fontFamily: 'Nerd',
          fontWeight: FontWeight.bold,
          // letterSpacing: 3,
        ),
      ),
    );
  }

  TextField emailField() {
    return TextField(
      focusNode: textFocusNodeEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: textControllerEmail,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _isEditingEmail = true;
        });
      },
      onSubmitted: (value) {
        textFocusNodeEmail.unfocus();
        FocusScope.of(context).requestFocus(textFocusNodePassword);
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blueGrey[800]!,
            width: 3,
          ),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.blueGrey[300],
        ),
        hintText: "Email",
        fillColor: Colors.white,
        errorText:
            _isEditingEmail ? _validateEmail(textControllerEmail.text) : null,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Padding passwordText() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        bottom: 8,
      ),
      child: Text(
        'Password',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: light2,
          fontSize: 18,
          fontFamily: 'Nerd',
          fontWeight: FontWeight.bold,
          // letterSpacing: 3,
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      focusNode: textFocusNodePassword,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: textControllerPassword,
      obscureText: true,
      autofocus: false,
      onChanged: (value) {
        setState(() {
          _isEditingPassword = true;
        });
      },
      onSubmitted: (value) {
        textFocusNodePassword.unfocus();
        FocusScope.of(context).requestFocus(textFocusNodePassword);
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blueGrey[800]!,
            width: 3,
          ),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.blueGrey[300],
        ),
        hintText: "Password",
        fillColor: Colors.white,
        errorText: _isEditingPassword
            ? _validatePassword(textControllerPassword.text)
            : null,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  // --------------- authButtons --------------- //

  Padding authButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.maxFinite,
              child: logInButton(),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.maxFinite,
              child: signUpButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget logInButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () async {
        setState(() {
          _isLoggingIn = true;
          textFocusNodeEmail.unfocus();
          textFocusNodePassword.unfocus();
        });
        if (_validateEmail(textControllerEmail.text) == null &&
            _validatePassword(textControllerPassword.text) == null) {
          await signInWithEmailPassword(
                  textControllerEmail.text, textControllerPassword.text)
              .then((result) {
            if (result != null) {
              print(result);
              setState(() {
                loginStatus = 'You have successfully logged in';
                loginStringColor = Colors.green;
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                widget.reloadPage();
                Navigator.of(context).pop();
              });
            }
          }).catchError((error) {
            print('Login Error: $error');
            setState(() {
              loginStatus = 'Error occured while logging in';
              loginStringColor = Colors.red;
            });
          });
        } else {
          setState(() {
            loginStatus = 'Please enter email & password';
            loginStringColor = Colors.red;
          });
        }
        setState(() {
          _isLoggingIn = false;
          textControllerEmail.text = '';
          textControllerPassword.text = '';
          _isEditingEmail = false;
          _isEditingPassword = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
        ),
        child: _isLoggingIn
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            : const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Nerd',
                  color: light2,
                ),
              ),
      ),
    );
  }

  TextButton signUpButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () async {
        setState(() {
          _isRegistering = true;
        });
        await registerWithEmailPassword(
                textControllerEmail.text, textControllerPassword.text)
            .then((result) {
          if (result != null) {
            setState(() {
              loginStatus = 'You have registered successfully';
              loginStringColor = Colors.green;
            });
            print(result);
          }
        }).catchError((error) {
          print('Registration Error: $error');
          setState(() {
            loginStatus = 'Error occured while registering';
            loginStringColor = Colors.red;
          });
        });

        setState(() {
          _isRegistering = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
        ),
        child: _isRegistering
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            : const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Nerd',
                  color: light2,
                ),
              ),
      ),
    );
  }

  // --------------- Terms of Service and Policy Declaration --------------- //

  Padding declaration() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'By proceeding, you agree to our Terms of Use and confirm you have read our Privacy Policy.',
        maxLines: 2,
        style: TextStyle(
          color: light2,
          fontSize: 14,
          fontFamily: "NerdBoldItalic",
          fontWeight: FontWeight.w300,
          // letterSpacing: 3,
        ),
      ),
    );
  }
}
