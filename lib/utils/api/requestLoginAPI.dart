import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:supbank_wallet/models/loginModel.dart';
import 'package:supbank_wallet/pages/home.dart';
import 'package:supbank_wallet/widgets/dialog/errorLoginUrlDialog.dart';
import 'dart:async' show Future;
import 'package:crypto/crypto.dart';
import 'package:supbank_wallet/widgets/dialog/errrorLoginDialog.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "http://10.14.104.150/loginapp";

  var key = utf8.encode(password);
  var bytes = utf8.encode("");

  var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
  var digest = hmacSha256.convert(bytes);
  String hmacSha256Value = digest.toString();

  Map<String, String> body = {
    'username': username,
    'password': hmacSha256Value,
  };

  final response = await http.post(
    url,
    body: body,
  );

  //TODO PRINT RESPONSE
  print('PASS HASH 256 : ' + hmacSha256Value);
  print('LOGIN POST Response : Code : ' +
      response.statusCode.toString() +
      " // " +
      response.body);

  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } else if (response.statusCode == 401) {
    showErrorLoginDialog(context);
  } else {
    showErrorServerDialog(context);
  }
  return null;
}
