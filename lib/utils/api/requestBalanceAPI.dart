import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:supbank_wallet/models/balanceModel.dart';
import 'dart:async' show Future;

var response;

Future<BalanceModel> requestBalanceAPI(String address) async {
  final url = "http://10.14.104.150:8080/getBalance";

  Map<String, String> body = {
    'address': address,
  };

  response = await http.post(
    url,
    body: body,
  );

  print("reponse : " + response.toString());

  //TODO PRINT RESPONSE
  print('GET Response code: ' +
      response.statusCode.toString() +
      "   " +
      response.body);

  responseBalance();

  return null;
}

responseBalance() {
  var data = json.decode(response.body);
  var rest = data["balance"] as int;
  print("BALANCE VALUE : $rest");
  return rest;
}
