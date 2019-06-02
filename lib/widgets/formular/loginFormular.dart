import 'package:flutter/material.dart';

final usernameController = TextEditingController();
final passwordController = TextEditingController();

String username = "";
String password = "";

void performLogin() {
  print('login attempt: $username // $password');
}

final logo = Image.asset(
  'images/logo2.png',
  width: 40.0,
  height: 40.0,
);

final loginTitle = Text(
  "Parallelcoin",
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
);

Widget loginEnter = TextField(
  onChanged: (usernameValue) {
    username = usernameValue;
  },
  autofocus: false,
  controller: usernameController,
  decoration: InputDecoration(
    hintText: 'Login',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

Widget passwordEnter = TextField(
  onChanged: (passwordValue) {
    password = passwordValue;
  },
  autofocus: false,
  obscureText: true,
  controller: passwordController,
  decoration: InputDecoration(
    hintText: 'Password',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);
