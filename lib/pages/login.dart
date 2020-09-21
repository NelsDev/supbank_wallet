import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supbank_wallet/utils/api/requestBalanceAPI.dart';
import 'package:supbank_wallet/utils/api/requestLoginAPI.dart';
import 'package:supbank_wallet/widgets/formular/loginFormular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          new Future.delayed(new Duration(seconds: 1), () {
            _onLoading();
            performLogin();
          });
        },
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: Text('Log In', style: TextStyle(color: Colors.blueAccent)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 20.0),
                loginTitle,
                SizedBox(height: 48.0),
                loginEnter,
                SizedBox(height: 10.0),
                passwordEnter,
                SizedBox(height: 24.0),
                loginButton
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Function> _onLoading() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          new SpinKitChasingDots(
            color: Colors.white,
            size: 50.0,
          ),
        ],
      ),
    );
    new Future.delayed(new Duration(seconds: 4), () {
      _login();
    });
    return null;
  }

  Future _login() async {
    //requestLoginAPI(context, username, password);
    //requestBalanceAPI(username);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
