import 'package:flutter/material.dart';
import 'package:supbank_wallet/widgets/formular/transactionFormular.dart';

Future<void> showSendDialog(BuildContext context) {

  String transactionInfo =
      'Your money has been sent !\n\n'
      'Public key: $publicKey \n\n'
      'Private key: $privateKey \n\n'
      'Amout: $amount ParallelCoin';

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Congratulations :D',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          transactionInfo,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
