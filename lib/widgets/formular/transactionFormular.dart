import 'package:flutter/material.dart';

final publicKeyController = TextEditingController();
final privateKeyController = TextEditingController();
final amountController = TextEditingController();

String publicKey = "";
String privateKey = "";
String amount = "";

void performSend() {
  print('login attempt: $publicKey // $privateKey // $amount');
}

final logo = Image.asset(
  'images/logo.png',
  width: 40.0,
  height: 40.0,
);

Widget publicKeyEnter = TextField(
  onChanged: (publicKeyValue) {
    publicKey = publicKeyValue;
  },
  autofocus: false,
  controller: publicKeyController,
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    hintText: 'receiver\'s public key',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  ),
);

Widget privateKeyEnter = TextField(
  onChanged: (privateKeyValue) {
    privateKey = privateKeyValue;
  },
  autofocus: false,
  controller: privateKeyController,
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    hintText: 'your private key',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  ),
);

Widget amountEnter = TextField(
  onChanged: (amountValue) {
    amount = amountValue;
  },
  autofocus: false,
  controller: amountController,
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    hintText: 'amount',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  ),
  keyboardType: TextInputType.number,
);