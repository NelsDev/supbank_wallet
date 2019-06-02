import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:supbank_wallet/models/sendModel.dart';
import 'package:supbank_wallet/widgets/dialog/errorSendDialog.dart';
import 'dart:async' show Future;

import 'package:supbank_wallet/widgets/dialog/sendDialog.dart';
import 'package:supbank_wallet/widgets/formular/transactionFormular.dart';

Future<SendModel> requestSendAPI(BuildContext context, String publicKey,
    String privateKey, String amount) async {
  final url = "http://10.14.104.150:80/sendapp";

  Map<String, dynamic> body = {
    'PublicKey': publicKey,
    'PrivateKey': privateKey,
    'Amount': amount
  };

  final response = await http.post(
    url,
    body: body,
  );

  //TODO PRINT RESPONSE
  print('SEND POST Response code: ' +
      response.statusCode.toString() +
      " // " +
      response.body);

  if (response.statusCode == 200) {
    showSendDialog(context);

    publicKeyController.clear();
    privateKeyController.clear();
    amountController.clear();
  } else {
    showErrorSendDialog(context);
  }
  return null;
}
